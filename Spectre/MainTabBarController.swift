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
                           makeVenueController(), notificationController()]

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
        let navigationController = UINavigationController(rootViewController: venue)
        navigationController.tabBarItem.title = .venue
        navigationController.tabBarItem.image = UIImage(systemName: "location.circle.fill")
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController

    }

    private func notificationController() -> UIViewController {

        let notification = NotificationPermissionsViewController()
        notification.title = .notification
        let navigationController = UINavigationController(rootViewController: notification)
        navigationController.tabBarItem.title = .notification
        navigationController.tabBarItem.image = UIImage(systemName: "text.bubble.fill")
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController

    }

    @IBAction func cancelOnboarding(_ unwindSegue: UIStoryboardSegue) {}

    @IBAction func completeRegistration(_ unwindSegue: UIStoryboardSegue) {}
}

private extension String {
    static let schedule = NSLocalizedString("Schedule", comment: "Schedule tab title.")
    static let venue = NSLocalizedString("Venue", comment: "Venue tab title.")
    static let notification = NSLocalizedString("Notification", comment: "Notification tab title.")

}
