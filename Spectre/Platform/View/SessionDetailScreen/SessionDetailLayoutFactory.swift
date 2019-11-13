//
//  SessionDetailLayoutFactory.swift
//  Spectre
//
//  Created by Dorin Danciu on 12/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionDetailLayoutFactory {
    func createTopicSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(118))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: layoutItem, count: 1)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        return layoutSection
    }

    func createAbstractSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: layoutItem, count: 1)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        return layoutSection
    }

    func createTableSection(_ section: SessionDetailSection) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        layoutSection.supplementariesFollowContentInsets = true
        if section != .actions {
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
        }
        return layoutSection
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(75))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
}
