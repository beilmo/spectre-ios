//
//  NetworkingViewController.swift
//  Spectre
//
//  Created by Alex Zaharia on 18/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class NetworkingViewController: UIViewController {
    @IBOutlet private weak var headerContainerView: UIView!
    @IBOutlet private weak var bodyContainerView: UIView!
    @IBOutlet private weak var headerContainerHeight: NSLayoutConstraint!

    private let cardViewController = NetworkingCardViewController()
    private let connectionListController = ConnectionListController()

    override func viewDidLoad() {
        super.viewDidLoad()

        embedCardViewController(cardViewController)
        embedConnectionsViewController(connectionListController)
    }

    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        if container === cardViewController {
            headerContainerHeight.constant = container.preferredContentSize.height
        }
    }

    func embedCardViewController(_ cardViewController: NetworkingCardViewController) {
        addChild(cardViewController)
        cardViewController.view.frame = headerContainerView.bounds
        headerContainerView.addSubview(cardViewController.view)
        cardViewController.didMove(toParent: self)
    }

    func embedConnectionsViewController(_ connectionListController: ConnectionListController) {
        addChild(connectionListController)
        connectionListController.view.frame = bodyContainerView.bounds
        bodyContainerView.addSubview(connectionListController.view)
        connectionListController.didMove(toParent: self)
    }
}
