//
//  MainViewController.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    let schedule = ScheduleCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [schedule.rootViewController]
    }
}
