//
//  SessionDetailViewController.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionDetailViewController: UICollectionViewController {
    private let layoutFactory = SessionDetailLayoutFactory()

    var dataSource: SessionDetailDataSource? {
        didSet {
            dataSource?.load()
        }
    }

    var detailItem: Date?

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .systemBackground

        collectionView.registerCell(SessionDetailTopicRow.self)
        collectionView.registerCell(SessionDetailAbstractRow.self)
        collectionView.registerCell(SessionDetailActionRow.self)
        collectionView.registerSupplementaryView(SessionDetailHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)

        collectionView.setCollectionViewLayout(makeNewLayout(), animated: false)
        dataSource?.load()
    }

    private func makeNewLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30

        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self, let dataSource = self.dataSource else { return nil }
            let section = dataSource.snapshot().sectionIdentifiers[sectionIndex]

            switch section {
            case .topic:
                return self.layoutFactory.createTopicSection()
            case .abstract:
                return self.layoutFactory.createAbstractSection()
            case .actions:
                return self.layoutFactory.createTableSection(section)
            case .speakers:
                return self.layoutFactory.createTableSection(section)
            case .resources:
                return self.layoutFactory.createTableSection(section)
            case .tags:
                return self.layoutFactory.createTableSection(section)
            }
        }

        layout.configuration = config

        return layout
    }
}
