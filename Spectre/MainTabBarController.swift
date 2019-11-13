//
//  MainTabBarController.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let schedule = ScheduleSplitViewController()

        viewControllers = [schedule]

//        StandardUserDefaultsConfig.hasSeenOnboarding = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        beginOnboardingIfNeeded()
    }
    
    private func beginOnboardingIfNeeded() {
        if !StandardUserDefaultsConfig.hasSeenOnboarding {
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            if let onboardingVC = storyboard.instantiateInitialViewController() {
                onboardingVC.modalPresentationStyle = .fullScreen
                present(onboardingVC, animated: false, completion: nil)

                StandardUserDefaultsConfig.hasSeenOnboarding = true
            }
        }
    }

    @IBAction func cancelOnboarding(_ unwindSegue: UIStoryboardSegue) {}

    @IBAction func completeRegistration(_ unwindSegue: UIStoryboardSegue) {}
}
