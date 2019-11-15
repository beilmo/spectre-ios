//
//  MoreViewController.swift
//  Spectre
//
//  Created by Nicu Danciu on 14/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

enum MoreDestination {
    case generalInformation
    case privacy
    case termsAndConditions
    case author
    case logIn
}

struct MoreAction {
    let title: String
    let destination: MoreDestination
}

struct MoreSection {
    let footerTitle: String?
    let actions: [MoreAction]
}
class MoreViewController: UITableViewController {
    var sections: [MoreSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        resolveSections()
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        let section = sections[sectionIndex]
        return section.actions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let action = section.actions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = action.title
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection sectionIndex: Int) -> String? {
        let section = sections[sectionIndex]
        return section.footerTitle
    }

    private func resolveSections() {
        sections.append(
            MoreSection(footerTitle: nil, actions: [
                MoreAction(title: .generalInformationTitle, destination: .generalInformation)
            ])
        )
        sections.append(
            MoreSection(footerTitle: nil, actions: [
                MoreAction(title: .privacyTitle, destination: .privacy),
                MoreAction(title: .authorTitle, destination: .author),
                MoreAction(title: .termsAndConditionsTitle, destination: .termsAndConditions)
            ])
        )
        sections.append(
            MoreSection(footerTitle: Bundle.main.debugAppVersion, actions: [
                MoreAction(title: .logInTitle, destination: .logIn)
            ])
        )
    }

}

private extension String {

    // MARK: - Localized Strings

    static let generalInformationTitle = NSLocalizedString("General Information", comment: "General Information title action")
    static let privacyTitle = NSLocalizedString("Privacy", comment: "Privacy title action")
    static let authorTitle = NSLocalizedString("Author", comment: "Author title action")
    static let termsAndConditionsTitle = NSLocalizedString("Terms And Conditions", comment: "Terms And Conditions title action")
    static let logInTitle = NSLocalizedString("Log In", comment: "Log In title action")
}

private extension Bundle {
// https://developer.apple.com/library/archive/qa/qa1544/_index.html
    var appName: String {
        return infoDictionary?["CFBundleName"] as! String
    }

    var bundleId: String {
        return bundleIdentifier!
    }

    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }

    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }

    var debugAppVersion: String {
        return "\(appName) v \(versionNumber) (Build \(buildNumber))"
    }
}



