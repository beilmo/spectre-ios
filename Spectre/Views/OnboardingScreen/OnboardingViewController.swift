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


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkInInfoLabel: UILabel!
    @IBOutlet weak var agendaInfoLabel: UILabel!
    @IBOutlet weak var questionsInfoLabel: UILabel!
    @IBOutlet weak var connectionsInfoLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var continueWithoutLoginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = String.onboardingTitle
        checkInInfoLabel.text = String.onboardingCheckInFeatureInfo
        agendaInfoLabel.text = String.onboardingAgendaFeatureInfo
        questionsInfoLabel.text = String.onboardingQuestionsFeatureInfo
        connectionsInfoLabel.text = String.onboardingQuestionsFeatureInfo
        loginButton.setTitle(String.onboardingLoginText, for: .normal)
        continueWithoutLoginButton.setTitle(String.onboardingSkipLoginText, for: .normal)
    }

    weak var delegate: OnboardingViewControllerDelegate?

    @IBAction func executeBeginRegistrationAction(_ sender: UIButton) {
        delegate?.onboardingViewControllerDidSelectBeginRegistration(self)
    }

    @IBAction func executeSkipRegistrationAction(_ sender: UIButton) {
        delegate?.onboardingViewControllerDidSelectSkipRegistration(self)
    }

}

extension String {
    static let onboardingTitle = "Get the best\nof our conference."
    static let onboardingCheckInFeatureInfo = "Use the app to check in at the registration desk, and claim your participant kit."
    static let onboardingAgendaFeatureInfo = "Personalize your agenda, and schedule your sessions in advance."
    static let onboardingQuestionsFeatureInfo = "Submit questions during the sessions, or upvote other interesting questions."
    static let onboardingConnectionsFeatureInfo = "Customize your attendace card and make new friends during the networking session. "
    static let onboardingLoginText = "Login"
    static let onboardingSkipLoginText = "Continue without logging in"

}
