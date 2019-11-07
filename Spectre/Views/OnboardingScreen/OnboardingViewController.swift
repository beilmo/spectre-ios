//
//  OnboardingViewController.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func onboardingViewControllerDidSelectBeginRegistration(_ controller: OnboardingViewController)
    func onboardingViewControllerDidSelectSkipRegistration(_ controller: OnboardingViewController)
}

class OnboardingViewController: UIViewController {

    weak var delegate: OnboardingViewControllerDelegate?

    @IBAction func executeBeginRegistrationAction(_ sender: UIButton) {
        delegate?.onboardingViewControllerDidSelectBeginRegistration(self)
    }

    @IBAction func executeSkipRegistrationAction(_ sender: UIButton) {
        delegate?.onboardingViewControllerDidSelectSkipRegistration(self)
    }

}
