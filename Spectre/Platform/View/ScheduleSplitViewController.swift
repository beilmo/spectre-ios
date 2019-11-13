//
//  ScheduleSplitViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class ScheduleSplitViewController: UISplitViewController, UISplitViewControllerDelegate, SessionListNavigator {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        tabBarItem.title = .schedule
        tabBarItem.image = UIImage(systemName: "calendar")
//        let minimumWidth = min(view.bounds.width, view.bounds.height);
//        minimumPrimaryColumnWidth = minimumWidth / 2;
//        maximumPrimaryColumnWidth = minimumWidth;

        viewControllers = [makeMasterController(), makeDefaultDetailController()]
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? SessionDetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

    // MARK: - SessionListNavigator

    func navigateToSessionDetail(_ sessionId: Int64) {
        // Create DetailViewController controller.
        let viewController = makeSessionDetailViewController(sessionId)

        // Present on the split view.
        showDetailViewController(viewController, sender: self)
    }

    // MARK: - Private

    private func makeSessionDetailViewController(_ id: Int64) -> UIViewController {
        let sessionDetail = SessionDetailViewController()
        sessionDetail.dataSource = SessionDetailDataSource(collectionView: sessionDetail.collectionView, useCaseFactory: .shared, sessionId: id)

        // Link displayModeButtonItem to DetailViewController's leftBarButtonItem.
        sessionDetail.navigationItem.leftItemsSupplementBackButton = true
        sessionDetail.navigationItem.leftBarButtonItem = displayModeButtonItem

        // Embed into NavigationController.
        let navigationController = UINavigationController(rootViewController: sessionDetail)
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }

    private func makeMasterController() -> UIViewController {
        let listController = SessionListViewController()
        listController.title = .schedule
        listController.navigator = self
        listController.dataSource = SessionListDataSource(useCaseFactory: .shared)

        let navigationController = UINavigationController(rootViewController: listController)
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }

    private func makeDefaultDetailController() -> UIViewController {
        let viewController = PlaceholderViewController()
        viewController.title = "Session Details"
        viewController.message = "Select a session from the side pannel in order to see its details."
        viewController.buttonTitle = "Take me to the sessions"
        viewController.buttonAction = { [weak self] in
            self?.preferredDisplayMode = .allVisible
        }

        return UINavigationController(rootViewController: viewController)
    }
}

private extension String {
    static let schedule = NSLocalizedString("Schedule", comment: "Schedule tab title.")
}
