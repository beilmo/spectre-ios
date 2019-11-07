//
//  MainCoordinator.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: ViewCoordinator {
    private var onboardingCoordinator: OnboardingCoordinator?
    let rootViewController: UIViewController

    /// True when this is the first time the app has been launched.
    var isFirstRun: Bool {
        return UserDefaults.standard.bool(forKey: .firstRunDefaultsKey) == true
    }

    init(viewController: UIViewController = UIViewController()) {
        self.rootViewController = viewController
    }

    func setupInWindow(_ window: UIWindow?) {
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        resolveInitialController()
    }

    private func resolveInitialController() {
        if isFirstRun {
            // If this is the first time the app is running, show the onboarding screen.
            self.presentOnboarding()

            // Mark that we've run the app at least once.
            UserDefaults.standard.set(true, forKey: .firstRunDefaultsKey)
        } else {
            embedDashboard()
        }
    }

    private func presentOnboarding() {
        let coordinator = OnboardingCoordinator()
        coordinator.delegate = self
        coordinator.rootViewController.modalPresentationStyle = .fullScreen
        onboardingCoordinator = coordinator
        rootViewController.present(coordinator.rootViewController, animated: false)
    }

    private func embedDashboard() {
        rootViewController.add(contentController: MainViewController())
    }
}

// MARK: - OnboardingCoordinatorDelegate

extension MainCoordinator: OnboardingCoordinatorDelegate {

    func onboardingCoordinatorDidResignOnboarding(_ coordinator: OnboardingCoordinator) {
        coordinator.rootViewController.dismiss(animated: true) { [weak self] in
            self?.onboardingCoordinator = nil
        }

        embedDashboard()
    }

    func onboardingCoordinatorDidCompleteOnboarding(_ coordinator: OnboardingCoordinator) {
        coordinator.rootViewController.dismiss(animated: true) { [weak self] in
            self?.onboardingCoordinator = nil
        }

        embedDashboard()
    }

}

extension String {
    static let firstRunDefaultsKey = "ShownFirstRun"
}
