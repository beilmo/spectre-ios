//
//  ScheduleCoordinator.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation
import UIKit

extension ScheduleCoordinator: ViewCoordinator {
    var rootViewController: UIViewController {
        return splitViewController
    }
}

class ScheduleCoordinator {

    let splitViewController: UISplitViewController

    init(splitViewController: UISplitViewController = UISplitViewController()) {
        self.splitViewController = splitViewController
    }

}

