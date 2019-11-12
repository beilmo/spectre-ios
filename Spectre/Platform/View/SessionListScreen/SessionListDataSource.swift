//
//  SessionListDataSource.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionListDataSource: NSObject, UITableViewDataSource {
    private let useCaseFactory: UseCaseFactory
    private var sessions = [SessionMetaResponse]() {
        didSet {
            updateHandler()
        }
    }

    // The closure that will gets called every time the data gets updated.
    var updateHandler: () -> Void = {}

    var selectedSessionId: Int64?

    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let session = sessions[indexPath.row]
        let cell: SessionRow = tableView.dequeueCell(for: indexPath)
        cell.display(startTime: session.startTime.shortTime())
        cell.display(duration: session.duration.minutes())
        cell.display(endTime: session.endTime.shortTime())
        cell.display(title: session.title)
        cell.display(room: session.room)
        return cell
    }

    func load() {
        useCaseFactory.makeScheduleUseCase().execute { [weak self] (result) in
            guard let self = self else { return }

            guard let newValue = try? result.get() else {
                return
            }

            self.sessions = newValue
        }
    }

    func select(_ row: Int) {
        if row < 0 || row >= sessions.count {
            selectedSessionId = nil
        }
        selectedSessionId = sessions[row].id
    }
}
