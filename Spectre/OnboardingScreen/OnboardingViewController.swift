//
//  OnboardingViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit


class OnboardingViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var registrationInfoLabel: UILabel!
    @IBOutlet weak var scheduleInfoLabel: UILabel!
    @IBOutlet weak var questionsInfoLabel: UILabel!
    @IBOutlet weak var networkingInfoLabel: UILabel!

    @IBOutlet weak var loginButton: ActionButton!
    @IBOutlet weak var skipLoginButton: ActionButton!

    @IBAction func unwindToOnboarding(_ unwindSegue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = .title
        registrationInfoLabel.text = .checkinInfo
        scheduleInfoLabel.text = .scheduleInfo
        questionsInfoLabel.text = .questionsInfo
        networkingInfoLabel.text = .networkingInfo

        loginButton.setTitle(.loginTitle, for: .normal)
        skipLoginButton.setTitle(.skipLoginTitle, for: .normal)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

private extension String {
    static let title = NSLocalizedString("Get the best of our conference.", comment: "Onboarding page title.")
    static let checkinInfo = NSLocalizedString("Use the app to check in at the registration desk, and claim your participant kit.", comment: "Onboarding checkin info.")
    static let scheduleInfo = NSLocalizedString("Personalize your agenda, and schedule your sessions in advance.", comment: "Onboarding schedule info.")
    static let questionsInfo = NSLocalizedString("Personalize your agenda, and schedule your sessions in advance.", comment: "Onboarding Q&A session info.")
    static let networkingInfo = NSLocalizedString("Customize your attendace card and make new friends during the networking session. ", comment: "Onboarding Networking info.")

    static let loginTitle = NSLocalizedString("Log In", comment: "Log In button title.")
    static let skipLoginTitle = NSLocalizedString("Continue without Logging in", comment: "Skip Log In button title.")
}
