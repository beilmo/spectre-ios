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

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadTerms()
    }

    func loadContent(from url: URL) {
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }

    private func loadTerms() {
        if let url = Bundle.main.url(forResource: "terms", withExtension: "html") {
            loadContent(from: url)
        }
    }
}
