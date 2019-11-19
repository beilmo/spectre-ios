//
//  ConnectionListController.swift
//  Spectre
//
//  Created by Alex Zaharia on 18/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class ConnectionListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorColor = .systemBackground
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell

        if let newCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") {
            cell = newCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIdentifier")
        }

        cell.textLabel?.text = "Alex Simeonov"
        cell.detailTextLabel?.text = .connectionDetails
        cell.detailTextLabel?.textColor = .systemGray

        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 56)
        let view = UIView(frame: frame)
        view.backgroundColor = .systemBackground

        let label = UILabel(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .connectionListTitle
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20)
        ])

        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

private extension String {
    static let connectionListTitle = NSLocalizedString("Your connections", comment: "Connection list title.")
    static let connectionDetails = NSLocalizedString("Subtitle", comment: "Connection details.")
}
