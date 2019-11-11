//
//  AgendaDetailsViewController.swift
//  Spectre
//
//  Created by Alex Zaharia on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class AgendaDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var agendaInfoLabel: UILabel!
    @IBOutlet weak var loginButton: ActionButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = .agendaTitle
        agendaInfoLabel.text = .agendaInfo
        loginButton.setTitle(.loginTitle, for: .normal)
        title = .title
    }
    
    @IBAction func didTapProfileButton(_ sender: Any) { }
}

private extension String {
    static let title = NSLocalizedString("My Agenda", comment: "Agenda page title.")
    static let agenda = NSLocalizedString("Agenda", comment: "Agenda tab title.")
    static let agendaTitle = NSLocalizedString("Login to use this feature", comment: "Agenda login info.")
    static let agendaInfo = NSLocalizedString("Log in to create your personalized agenda, connect with attendees and more.", comment: "Agenda feature info.")
    static let loginTitle = NSLocalizedString("Log In", comment: "Login button title.")
}
