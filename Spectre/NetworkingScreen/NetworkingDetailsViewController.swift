//
//  NetworkingDetailsViewController.swift
//  Spectre
//
//  Created by Alex Zaharia on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class NetworkingDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var networkingInfoLabel: UILabel!
    @IBOutlet weak var loginButton: ActionButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = .agendaTitle
        networkingInfoLabel.text = .agendaInfo
        loginButton.setTitle(.loginTitle, for: .normal)

        title = .title
    }

    @IBAction func didTapProfileButton(_ sender: Any) { }
}

private extension String {
    static let title = NSLocalizedString("Networking", comment: "Networking page title.")
    static let networking = NSLocalizedString("Networking", comment: "networking tab title.")
    static let agendaTitle = NSLocalizedString("Login to use this feature", comment: "Agenda login info.")
    static let agendaInfo = NSLocalizedString("Log in to create your personalized agenda, connect with attendees and more.", comment: "Networking feature info.")
    static let loginTitle = NSLocalizedString("Log In", comment: "Login button title.")
}

