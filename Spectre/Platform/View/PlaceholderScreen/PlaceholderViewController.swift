//
//  PlaceholderViewController.swift
//  Spectre
//
//  Created by Alex Zaharia on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class PlaceholderViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.image = nil
        }
    }
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = nil
        }
    }
    @IBOutlet private weak var messageLabel: UILabel! {
        didSet {
            messageLabel.text = nil
        }
    }
    @IBOutlet private weak var actionButton: ActionButton! {
        didSet {
            actionButton.setTitle(nil, for: .normal)
        }
    }

    override var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }

    var message: String? = nil {
        didSet {
            messageLabel?.text = message
        }
    }

    var image: UIImage? = nil {
        didSet {
            imageView?.image = image
        }
    }

    var buttonTitle: String? = nil {
        didSet {
            actionButton?.setTitle(buttonTitle, for: .normal)
        }
    }

    var buttonAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        titleLabel.text = title
        messageLabel.text = message
        actionButton.setTitle(buttonTitle, for: .normal)
    }

    @IBAction private func didTapActionButton(_ sender: Any) {
        buttonAction?()
    }
}
