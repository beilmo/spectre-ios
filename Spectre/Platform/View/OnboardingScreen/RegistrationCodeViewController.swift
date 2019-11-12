//
//  RegistrationCodeViewController.swift
//  Spectre
//
//  Created by Dorin Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class RegistrationCodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var noCodeReceivedButton: UIButton!

    let nextButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = .title
        subtitleLabel.text = .subtitle

        noCodeReceivedButton.setTitle(.noCodeReceived, for: .normal)
        noCodeReceivedButton.titleLabel?.textAlignment = .center

        nextButton.title = .next
        nextButton.isEnabled = false
        nextButton.action = #selector(executeNextAction)

        navigationItem.rightBarButtonItem = nextButton
    }

    @objc private func executeNextAction() {

    }
}

private extension String {
    // MARK: - Storyboard Identifiers


    // MARK: - Localized Strings

    static let title = NSLocalizedString("Registration", comment: "Registration title")
    static let subtitle = NSLocalizedString("Enter the validation code we’ve just emailed you.", comment: "Registration code message")
    static let noCodeReceived = NSLocalizedString("Didn't got the code?\nTap here to request a new one.", comment: "Registration no code received")
    static let next = NSLocalizedString("Next", comment: "Next button title")
}
