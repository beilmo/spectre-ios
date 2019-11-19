//
//  NetworkingCardViewController.swift
//  Spectre
//
//  Created by Alex Zaharia on 18/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class NetworkingCardViewController: UIViewController {

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var profileDetailsLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var shareCardButton: UIButton!
    @IBOutlet private weak var scanCardButton: UIButton!

    var profileImage: UIImage? = nil {
        didSet {
            profileImageView.image = profileImage
        }
    }
    var name: String? = nil {
        didSet {
            nameLabel.text = name
        }
    }
    var profileDetails: String? = nil {
        didSet {
            profileDetailsLabel.text = profileDetails
        }
    }
    var info: String? = nil {
        didSet {
            infoLabel.text = info
        }
    }
    var shareCardButtonTitle: String? = nil {
        didSet {
            shareCardButton.setTitle(shareCardButtonTitle, for: .normal)
        }
    }
    var scanCardButtonTitle: String? = nil {
        didSet {
            scanCardButton.setTitle(scanCardButtonTitle, for: .normal)
        }
    }

    var shareAction: (()-> Void)?
    var scanAction: (()-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        //rounded profile image with 1px border
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.height / 2.0
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.systemGray.cgColor

        shareCardButton.imageView?.tintColor = .white
        shareCardButton.setImage(UIImage(systemName: "qrcode", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)
        scanCardButton.imageView?.tintColor = .white
        scanCardButton.setImage(UIImage(systemName: "qrcode.viewfinder", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)

        //profile details
        profileImage = UIImage(systemName: "person.fill")
        name = "John Devoratorul de Sarmale"
        profileDetails = .profileDetails
        info = .info
        shareCardButtonTitle = .shareCardButtonTitle
        scanCardButtonTitle = .scanCardButtonTitle
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resolvePreferredContentSize(view.frame.width)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        resolvePreferredContentSize(size.width)
    }

    @IBAction private func didTapShareCardButton() {

    }

    @IBAction private func didTapScanCardButton() {

    }

    private func resolvePreferredContentSize(_ targetWidth: CGFloat) {
        let height = UIView.layoutFittingCompressedSize.height
        let targetSize = CGSize(width: targetWidth, height: height)
        let resolvedSize = view.systemLayoutSizeFitting(targetSize)
        
        preferredContentSize = CGSize(width: targetWidth, height: resolvedSize.height)
    }
}

private extension String {
    static let profileDetails = NSLocalizedString("Email, Phone number, Bio, Social", comment: "Details to be shared")
    static let info = NSLocalizedString("The above personal details will be shared when you let someone scan your card.", comment: "Details what is going to be shared")
    static let shareCardButtonTitle = NSLocalizedString("Share Card", comment: "Title of Share Card Button")
    static let scanCardButtonTitle = NSLocalizedString("Scan Card", comment: "Title of Scan Card Button")
}
