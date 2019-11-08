//
//  OnboardingViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit


class OnboardingViewController: UIViewController {

    @IBAction func unwindToOnboarding(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue

        dismiss(animated: true, completion: nil)
    }

}
