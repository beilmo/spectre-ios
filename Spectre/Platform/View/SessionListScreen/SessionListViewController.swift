//
//  SessionListViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

protocol SessionListNavigator {
    func navigateToSessionDetail(_ sessionId: Int64)
}

class SessionListViewController: UITableViewController {

    // MARK: - Properties
    var dataSource: SessionListDataSource!
    var navigator: SessionListNavigator!

    // MARK: - Initializers

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 58
        
        tableView.registerCell(SessionRow.self)
        tableView.dataSource = dataSource

        dataSource.updateHandler = tableView.reloadData
        dataSource.load()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.select(indexPath.row)
        if let sessionId = dataSource.selectedSessionId {
            navigator.navigateToSessionDetail(sessionId)
        }
    }
}
