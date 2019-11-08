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

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            if let url = Bundle.main.url(forResource: "terms", withExtension: "html") {
                webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
