//
//  MainTabBarController.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let schedule = ScheduleSplitViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let agendaStoryboard = UIStoryboard(name: "AgendaDetails", bundle: nil)
        guard let agenda = agendaStoryboard.instantiateInitialViewController() else {
            return
        }

        let networkingStoryboard = UIStoryboard(name: "NetworkingDetails", bundle: nil)
        guard let networking = networkingStoryboard.instantiateInitialViewController() else {
            return
        }

        schedule.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
        agenda.tabBarItem = UITabBarItem(title: "Agenda", image: UIImage(systemName: "text.badge.plus"), tag: 1)
        networking.tabBarItem = UITabBarItem(title: "Networking", image: UIImage(systemName: "person.3.fill"), tag: 2)

        viewControllers = [schedule, agenda, networking]

        StandardUserDefaultsConfig.hasSeenOnboarding = false
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
