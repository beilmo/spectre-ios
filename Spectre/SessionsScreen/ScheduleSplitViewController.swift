//
//  ScheduleSplitViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class ScheduleSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    private let primaryController = UINavigationController()
    private let secondaryController = UINavigationController()
    private let masterViewController = SessionListController()
    private let detailViewController = SessionDetailController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        primaryController.navigationBar.prefersLargeTitles = true
        primaryController.viewControllers = [masterViewController]
        
        secondaryController.navigationBar.prefersLargeTitles = true
        secondaryController.viewControllers = [detailViewController]
        
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = displayModeButtonItem

        viewControllers = [primaryController, secondaryController]

        title = .schedule
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? SessionDetailController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

private extension String {
    static let schedule = NSLocalizedString("Schedule", comment: "Schedule tab title.")
}
