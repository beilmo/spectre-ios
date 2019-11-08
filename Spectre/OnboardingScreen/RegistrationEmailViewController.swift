//
//  RegistrationEmailViewController.swift
//  Spectre
//
//  Created by Dorin Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class RegistrationEmailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgotEmailButton: UIButton!

    let nextButton = UIBarButtonItem()
    let predicate = EmailPredicate()

    deinit {
        NotificationCenter.default.removeObserver(self, name: UITextField.textDidChangeNotification, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = .title
        subtitleLabel.text = .subtitle
        emailLabel.text = .email
        emailTextField.placeholder = .emailPlaceholder
        forgotEmailButton.setTitle(.forgotEmail, for: .normal)
        forgotEmailButton.titleLabel?.textAlignment = .center

        nextButton.title = .next
        nextButton.isEnabled = false
        nextButton.action = #selector(executeNextAction)

        navigationItem.rightBarButtonItem = nextButton
        navigationItem.backBarButtonItem?.title = .back
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: emailTextField, queue: .main, using: validateEmail(_:))

        emailTextField.becomeFirstResponder()
    }

    func validateEmail(_ notification: Notification) {
        nextButton.isEnabled = predicate.evaluate(with: emailTextField.text ?? "")
    }

    @objc private func executeNextAction() {
        performSegue(withIdentifier: .navigateToRegistrationCode, sender: self)
    }

}

private extension String {

    // MARK: - Storyboard Identifiers

    static let navigateToRegistrationCode = "NavigateToRegistrationCode"

    // MARK: - Localized Strings

    static let title = NSLocalizedString("Registration", comment: "Registration title")
    static let subtitle = NSLocalizedString("Register with the email address you purchased your ticket with.", comment: "Registration email message")
    static let email = NSLocalizedString("Email", comment: "Registration email")
    static let emailPlaceholder = "j.appleseed@icloud.com"
    static let forgotEmail = NSLocalizedString("Forgot your email address used during ticket purchase?", comment: "Registration forgot email")
    static let next = NSLocalizedString("Next", comment: "Next button title")
    static let back = NSLocalizedString("Back", comment: "Back button title")
}
