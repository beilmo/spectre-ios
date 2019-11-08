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

        navigationItem.rightBarButtonItem = nextButton

        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: emailTextField, queue: .main, using: validateEmail(_:))

    }

    func validateEmail(_ notification: Notification) {
        nextButton.isEnabled = predicate.evaluate(with: emailTextField.text ?? "")
    }

}

private extension String {
    static let title = NSLocalizedString("Registration", comment: "Registration title")
    static let subtitle = NSLocalizedString("Register with the email address you purchased your ticket with.", comment: "Registration email message")
    static let email = NSLocalizedString("Email", comment: "Registration email")
    static let emailPlaceholder = "j.appleseed@icloud.com"
    static let forgotEmail = NSLocalizedString("Forgot your email address used during ticket purchase?", comment: "Registration forgot email")
    static let next = NSLocalizedString("Next", comment: "Next button title")
}
