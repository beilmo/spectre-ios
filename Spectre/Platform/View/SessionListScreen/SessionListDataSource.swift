//
//  SessionListDataSource.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

enum SessionFilterCategory: Int, FilterCategory {
    case platform
    case keyword

    var name: String {
        switch self {
        case .platform:
            return "Platform"
        case .keyword:
            return "Keyword"
        }
    }

    var priority: Int {
        return rawValue
    }
}

struct SessionFilter: Filter {
    let icon: UIImage?
    let name : String
    let category: AnyFilterCategory
}

func ==(lhs: SessionFilter, rhs: SessionFilter) -> Bool {
    return lhs.name == rhs.name
}

func transformKeywordToSessionFilter(_ keyword: String) -> SessionFilter {
    let category = AnyFilterCategory(SessionFilterCategory.keyword)
    return SessionFilter(icon: nil, name: keyword, category: category)
}

func transformPlatformToSessionFilter(_ platformName: String) -> SessionFilter {
    let category = AnyFilterCategory(SessionFilterCategory.platform)
    return SessionFilter(icon: nil, name: platformName, category: category)
}

func transformSessionFilterToKeyword(_ item: SessionFilter) -> String {
    return item.name
}

class SessionListDataSource: NSObject, UITableViewDataSource {
    private let useCaseFactory: UseCaseFactory

    private var sessionList = [SessionMetaResponse]()

    private var filteredSessionList = [SessionMetaResponse]() {
        didSet {
            updateHandler()
        }
    }

    private(set) var knownFilters: Set<SessionFilter> = []

    private(set) var activeFilters: Set<SessionFilter> = []

    private(set) var selectedSessionId: Int64?

    // The closure that will gets called every time the data gets updated.
    var updateHandler: () -> Void = {}


    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }

    // MARK: - Public API

    func load() {
        useCaseFactory.makeScheduleUseCase().execute { [weak self] (result) in
            guard let self = self else { return }

            guard let newValue = try? result.get() else {
                return
            }

            // Resolve filters
            self.knownFilters = newValue.reduce(Set<SessionFilter>(), { (collector, candidate) in
                let filters = candidate.keywords.map(transformKeywordToSessionFilter(_:))
                return collector.union(filters)
            })
            self.knownFilters.insert(transformPlatformToSessionFilter("iOS"))
            self.activeFilters = self.knownFilters

            // Resolve session list
            self.sessionList = newValue
            self.filteredSessionList = newValue
        }
    }

    func select(row: Int) {
        if row < 0 || row >= filteredSessionList.count {
            selectedSessionId = nil
        }
        selectedSessionId = filteredSessionList[row].id
    }

    func refine(matching filters: Set<SessionFilter>) {
        activeFilters = filters

        let keywords = filters.map(transformSessionFilterToKeyword(_:))
        filteredSessionList = sessionList.filter({ candidate in
            return !candidate.keywords.intersection(keywords).isEmpty
        })
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSessionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let session = filteredSessionList[indexPath.row]
        let cell: SessionRow = tableView.dequeueCell(for: indexPath)
        cell.display(startTime: session.startTime.shortTime())
        cell.display(duration: session.duration.minutes())
        cell.display(endTime: session.endTime.shortTime())
        cell.display(title: session.title)
        cell.display(room: session.room)
        return cell
    }
}
