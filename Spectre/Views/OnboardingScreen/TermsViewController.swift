//
//  TermsViewController.swift
//  Spectre
//
//  Created by Dorin Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

protocol TermsViewControllerDelegate: AnyObject {
    func termsViewControllerDidAcceptTerms(_ controller: TermsViewController)
    func termsViewControllerDidDeclineTerms(_ controller: TermsViewController)
}

class TermsViewController: UIViewController {

    weak var delegate: TermsViewControllerDelegate?

    @IBAction func executeAcceptTermsAction(_ sender: UIButton) {
        delegate?.termsViewControllerDidAcceptTerms(self)
    }

    @IBAction func executeDeclineTermsAction(_ sender: UIButton) {
        delegate?.termsViewControllerDidDeclineTerms(self)
    }

}
