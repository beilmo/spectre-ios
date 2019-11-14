//
//  VenueLayoutFactory.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class VenueLayoutFactory {
    func createMapSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: layoutItem, count: 1)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 16, bottom: 0, trailing: 16)
        layoutSection.boundarySupplementaryItems = [createSectionFooter()]
        return layoutSection
    }

    func createAbstractSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: layoutItem, count: 1)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
        layoutSection.boundarySupplementaryItems = [createSectionHeader(), createSectionFooter()]
        return layoutSection
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(22))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }

    func createSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let layoutSectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionFooterSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return layoutSectionFooter
    }
}

