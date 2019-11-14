//
//  NotificationPermissionsViewController.swift
//  Spectre
//
//  Created by Nicu Danciu on 14/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class NotificationPermissionsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var notificationSubtitleLabel: UILabel!
    @IBOutlet weak var notificationsSubtitleLabel2: UILabel!
    @IBOutlet weak var allowNotificationButton: ActionButton!
    @IBOutlet weak var askMeLaterButton: ActionButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = .title
        notificationSubtitleLabel.text = .notificationSubtitle
        notificationsSubtitleLabel2.text = .notificationsSubtitle2
        allowNotificationButton.setTitle(.allowNotification, for: .normal)
        askMeLaterButton.setTitle(.askMeLater, for: .normal)

        titleLabel.font = .preferredFont(forTextStyle: .title1, weight: .bold)
        notificationSubtitleLabel.font = .preferredFont(forTextStyle: .body, weight: .regular)
        notificationsSubtitleLabel2.font = .preferredFont(forTextStyle: .body, weight: .regular)
        allowNotificationButton.titleLabel?.adjustsFontForContentSizeCategory = true
        allowNotificationButton.titleLabel?.font = .preferredFont(forTextStyle: .body, weight: .semibold)
        allowNotificationButton.titleLabel?.numberOfLines = 0
        allowNotificationButton.titleLabel?.textAlignment = .center
        askMeLaterButton.titleLabel?.adjustsFontForContentSizeCategory = true
        askMeLaterButton.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        askMeLaterButton.titleLabel?.numberOfLines = 0
        askMeLaterButton.titleLabel?.textAlignment = .center

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func allowNotificationsAction(_ sender: Any) {

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { [ weak self] (granted, error) in
            if granted {
                DispatchQueue.main.async {
                    self?.dismiss(animated: true, completion: nil)
                }
            } else {
                DispatchQueue.main.async {
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}

private extension String {
    // MARK: - Storyboard Identifiers

    // MARK: - Localized Strings

    static let title = NSLocalizedString("Allow push notifications", comment: "Notifications title")
    static let notificationSubtitle = NSLocalizedString("Be notified about important updates announcements, and more. We won’t spam you.", comment: "Notifications subtitle message")
    static let notificationsSubtitle2 = NSLocalizedString("You can fine tune which notifications you want to receive via the settings page.", comment: "Notifications subtitle message")
    static let allowNotification = NSLocalizedString("Allow notifications", comment: "Allow notifications button title")
    static let askMeLater = NSLocalizedString("Ask me later", comment: "Ask me later title")
}
