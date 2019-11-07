//
//  OnboardingCoordinator.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation
import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    func onboardingCoordinatorDidResignOnboarding(_ coordinator: OnboardingCoordinator)
    func onboardingCoordinatorDidCompleteOnboarding(_ coordinator: OnboardingCoordinator)
}

extension OnboardingCoordinator: ViewCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
}

class OnboardingCoordinator {

    weak var delegate: OnboardingCoordinatorDelegate?

    let navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)

        navigateToOnboarding()
    }

    // MARK: - Private

    private func navigateToOnboarding() {
        if let onboardingVC = navigationController.viewControllers.first(where: {$0 is OnboardingViewController}) {
            navigationController.popToViewController(onboardingVC, animated: true)
        } else {
            let onboardingVC = makeOnboardingViewController()
            onboardingVC.delegate = self
            navigationController.pushViewController(onboardingVC, animated: true)
        }
    }

    private func navigateToTerms() {
        let termsVC = makeTermsViewController()
        termsVC.delegate = self
        navigationController.pushViewController(termsVC, animated: true)
    }

    private func resignOnboarding() {
        delegate?.onboardingCoordinatorDidResignOnboarding(self)
    }
}

extension OnboardingCoordinator: OnboardingViewControllerDelegate {
    func onboardingViewControllerDidSelectBeginRegistration(_ controller: OnboardingViewController) {
        navigateToTerms()
    }

    func onboardingViewControllerDidSelectSkipRegistration(_ controller: OnboardingViewController) {
        resignOnboarding()
    }
}

extension OnboardingCoordinator: TermsViewControllerDelegate {
    func termsViewControllerDidAcceptTerms(_ controller: TermsViewController) {
        resignOnboarding()
    }

    func termsViewControllerDidDeclineTerms(_ controller: TermsViewController) {
        navigateToOnboarding()
    }
}

extension OnboardingCoordinator {
    private func makeOnboardingViewController() -> OnboardingViewController {
        return OnboardingViewController()
    }

    private func makeTermsViewController() -> TermsViewController {
        return TermsViewController()
    }
}
