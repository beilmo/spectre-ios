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

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(didTapFilter(_:)))

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 58
        
        tableView.registerCell(SessionRow.self)
        tableView.dataSource = dataSource

        dataSource.updateHandler = tableView.reloadData
        dataSource.load()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.select(row: indexPath.row)
        if let sessionId = dataSource.selectedSessionId {
            navigator.navigateToSessionDetail(sessionId)
        }
    }

    @objc func didTapFilter(_ sender: UIBarButtonItem) {
        let allFilters = Set(dataSource.knownFilters.map({AnyFilter($0)}))
        let selectedFilters = Set(dataSource.activeFilters.map({AnyFilter($0)}))

        let filterController = FilterViewController(allFilters: allFilters,
                                                         selectedFilters: selectedFilters)

        filterController.delegate = self
        let navController = UINavigationController(rootViewController: filterController)
        navController.isToolbarHidden = false

        if UIDevice.current.userInterfaceIdiom == .pad {
            navController.modalPresentationStyle = .popover
            navController.popoverPresentationController?.barButtonItem = sender
        }

            let width = view.bounds.width + 50
        let height = view.bounds.height / 1.2
            navController.preferredContentSize = CGSize(width: width, height: height)

        present(navController, animated: true)
    }

}

// MARK: - FilterViewControllerDelegate

extension SessionListViewController: FilterViewControllerDelegate {
    func filterController(_ controller: FilterViewController, didUpdate selectedFilters: Set<AnyFilter>) {
        let updatedFilters = selectedFilters.compactMap({$0.base as? SessionFilter})
        dataSource.refine(matching: Set(updatedFilters))
    }
}
