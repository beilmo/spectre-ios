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

        viewControllers = [makeScheduleViewController(),
                           makeVenueController(),
                           makeMoreController()]
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

    private func makeScheduleViewController() -> UIViewController {
        let schedule = ScheduleSplitViewController()
        schedule.tabBarItem.title = .schedule
        schedule.tabBarItem.image = UIImage(systemName: "calendar")
        return schedule
    }

    private func makeVenueController() -> UIViewController {

        let venue = VenueViewController(collectionViewLayout: UICollectionViewFlowLayout())
        venue.title = .venue
        let venueNavigationController = UINavigationController(rootViewController: venue)
        venueNavigationController.tabBarItem.title = .venue
        venueNavigationController.tabBarItem.image = UIImage(systemName: "location.circle.fill")
        venueNavigationController.navigationBar.prefersLargeTitles = true
        return venueNavigationController
    }

    private func makeMoreController() -> UIViewController {

        let more = MoreViewController(style: .grouped)
        more.title = .more
        let moreNavigationController = UINavigationController(rootViewController: more)
        moreNavigationController.tabBarItem.title = .more
        moreNavigationController.tabBarItem.image = UIImage(systemName: "ellipsis.circle")
        moreNavigationController.navigationBar.prefersLargeTitles = true
        return moreNavigationController
    }

    @IBAction func cancelOnboarding(_ unwindSegue: UIStoryboardSegue) {}

    @IBAction func completeRegistration(_ unwindSegue: UIStoryboardSegue) {}
}

private extension String {
    static let schedule = NSLocalizedString("Schedule", comment: "Schedule tab title.")
    static let venue = NSLocalizedString("Venue", comment: "Venue tab title.")
    static let more = NSLocalizedString("More", comment: "More tab title.")
}
