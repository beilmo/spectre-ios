//
//  TermsViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit
import WebKit

class TermsViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var disagreeButton: UIBarButtonItem!
    @IBOutlet weak var agreeButton: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = .title
        disagreeButton.title = .declineTitle
        agreeButton.title = .acceptTitle

        let attributes: [NSAttributedString.Key : Any] = [ .font: UIFont.boldSystemFont(ofSize: 16) ]
        agreeButton.setTitleTextAttributes(attributes, for: .normal)

        loadTerms()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.title = .back
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func loadContent(from url: URL) {
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }

    private func loadTerms() {
        if let url = Bundle.main.url(forResource: "terms", withExtension: "html") {
            loadContent(from: url)
        }
    }
    @IBAction func executeAgreeAction(_ sender: Any) {
        let controller = UIAlertController(title: .title, message: .message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: .cancel, style: .cancel, handler: nil))
        controller.addAction(UIAlertAction(title: .acceptTitle, style: .default, handler: handleTermsAcceptance(_:)))

        present(controller, animated: true, completion: nil)
    }

    func handleTermsAcceptance(_ sender: UIAlertAction) {
        performSegue(withIdentifier: .navigateToRegistration, sender: self)
    }
}

private extension String {

    // MARK: - Storyboard Identifiers

    static let navigateToRegistration = "NavigateToRegistrationEmail"

    // MARK: - Localized Strings

    static let acceptTitle = NSLocalizedString("Agree", comment: "License agreement button title.")
    static let declineTitle = NSLocalizedString("Disagree", comment: "License disagreement button title.")
    static let title = NSLocalizedString("Terms and Conditions", comment: "License agreement title.")
    static let message = NSLocalizedString("I agree to the Terms and Conditions.", comment: "License agreement message.")
    static let cancel = NSLocalizedString("Cancel", comment: "Cancel button title")
    static let back = NSLocalizedString("Back", comment: "Back button title")
}
