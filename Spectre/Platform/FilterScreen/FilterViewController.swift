//
//  FilterViewController.swift
//  Spectre
//
//  Created by Alex Zaharia on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

protocol FilterCategory: Hashable {
    var name: String { get }
    var priority: Int { get }
}

struct AnyFilterCategory: FilterCategory, Comparable {

    private(set) var base: Any

    let name: String
    let priority: Int

    init<H>(_ base: H) where H : FilterCategory {
        self.base = base
        name = base.name
        priority = base.priority
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(priority)
    }

    static func < (lhs: AnyFilterCategory, rhs: AnyFilterCategory) -> Bool {
        return lhs.priority < rhs.priority
    }

    static func == (lhs: AnyFilterCategory, rhs: AnyFilterCategory) -> Bool {
        return lhs.name == rhs.name
    }
}

protocol Filter: Hashable {
    var icon: UIImage? { get }
    var name: String { get }
    var category: AnyFilterCategory { get }
}

struct AnyFilter: Filter, Comparable {
    private(set) var base: Any

    let icon: UIImage?
    let name: String
    let category: AnyFilterCategory

    init<H>(_ base: H) where H : Filter {
        self.base = base

        category = base.category
        icon = base.icon
        name = base.name
    }

    func hash(into hasher: inout Hasher) {
        if let icon = icon {
            hasher.combine(icon)
        }
        hasher.combine(name)
        hasher.combine(category)
    }

    static func == (lhs: AnyFilter, rhs: AnyFilter) -> Bool {
        return lhs.category == rhs.category && lhs.name == rhs.name
    }

    static func < (lhs: AnyFilter, rhs: AnyFilter) -> Bool {
        if lhs.category == rhs.category {
            return lhs.name.caseInsensitiveCompare(rhs.name) == .orderedAscending
        } else {
            return lhs.category < rhs.category
        }
    }
}

private struct FilterTableSection: Comparable {
    let category: AnyFilterCategory
    let items: [AnyFilter]

    static func < (lhs: FilterTableSection, rhs: FilterTableSection) -> Bool {
        return lhs.category < rhs.category
    }
}

protocol FilterViewControllerDelegate: AnyObject {
    func filterController(_ controller: FilterViewController, didUpdate selectedFilters: Set<AnyFilter>)
}

class FilterViewController: UITableViewController {

    //MARK: Properties

    weak var delegate: FilterViewControllerDelegate?

    private var sections: [FilterTableSection] = []

    private let allFilters: Set<AnyFilter>

    private var selectedFilters: Set<AnyFilter> {
        didSet {
            updateTitle()
            updateVisibleRows()
            delegate?.filterController(self, didUpdate: selectedFilters)
        }
    }

    init(allFilters: Set<AnyFilter>, selectedFilters: Set<AnyFilter>) {
        self.allFilters = allFilters
        self.selectedFilters = selectedFilters


        let groups = allFilters.reduce(into: [AnyFilterCategory: [AnyFilter]]()) { (collector, candidate) in
            var list = collector[candidate.category] ?? [AnyFilter]()
            list.append(candidate)
            collector[candidate.category] = list
        }

        self.sections = groups.enumerated().map { touple in
            return FilterTableSection(category: touple.element.key, items: touple.element.value.sorted())
        }.sorted()

        super.init(style: .grouped)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavButtons()

        updateTitle()

        tableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "filterCell")

        tableView.sectionHeaderHeight = 50
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return sections[sectionIndex].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let isSelected = selectedFilters.contains(item)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as? FilterTableViewCell else {
            fatalError("Cannot dequeue")
        }

        cell.selectionStyle = .none

        cell.icon.image = item.icon
        cell.checkBox.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle")
        cell.label.text = item.name

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].category.name
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].items[indexPath.row]
        let isSelected = selectedFilters.contains(item)

        if isSelected {
            selectedFilters.remove(item)
        } else {
            selectedFilters.insert(item)
        }
    }

    //MARK: Methods

     private func updateTitle() {
         title = "\(selectedFilters.count) of \(allFilters.count)"
     }

     private func updateVisibleRows() {
         tableView.reloadRows(at: tableView.indexPathsForVisibleRows ?? [], with: .none)
     }

     private func setupNavButtons() {
         let cancelButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapCancel))
         navigationItem.rightBarButtonItem = cancelButton

         let leftButton = UIBarButtonItem(title: "Deselect All", style: .plain, target: self, action: #selector(didTapDeselectAll))
         let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
         let rightButton = UIBarButtonItem(title: "Select All", style: .plain, target: self, action: #selector(didTapSelectAll))
         let items = [leftButton, spacer, rightButton]
         setToolbarItems(items, animated: false)
     }

     @objc private func didTapCancel() {
         dismiss(animated: true, completion: nil)
     }

     @objc private func didTapDeselectAll() {
         selectedFilters.removeAll()
     }

     @objc private func didTapSelectAll() {
         selectedFilters = allFilters
     }
}
