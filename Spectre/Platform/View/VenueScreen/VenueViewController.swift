//
//  VenueViewController.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit
import MapKit

enum VenueSection: CaseIterable {
    case map
    case checkIn
    case codeOfConduct
    case beyond
}

class VenueViewController: UICollectionViewController {
    
    private let layoutFactory = VenueLayoutFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .systemBackground
        collectionView.registerCell(VenueMapRow.self)
        collectionView.registerCell(VenueAbstractRow.self)
        collectionView.registerSupplementaryView(VenueHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)
        collectionView.registerSupplementaryView(VenueFooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
        collectionView.setCollectionViewLayout(makeNewLayout(), animated: false)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return VenueSection.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = VenueSection.allCases[indexPath.section]
        switch section {
        case .map:
            let cell: VenueMapRow = collectionView.dequeueCell(for: indexPath)
            cell.actionHandler = { [weak self] in
                //                self?.navigationController?.pushViewController(, animated: true)
                print("hello")
            }
            cell.display()
            return cell
        case .checkIn:
            let cell: VenueAbstractRow = collectionView.dequeueCell(for: indexPath)
            cell.display(text: "The styling and layout of text is a hallmark feature of an outstanding reading experience. Technologies such as CoreText and TextKit give you the tools you need to create a great text layout. Learn how to make an equally great accessible experience for VoiceOver by adopting the accessibility reading content protocol, adding automatic page turning, and customizing speech output.")
            return cell
        case .codeOfConduct:
            let cell: VenueAbstractRow = collectionView.dequeueCell(for: indexPath)
            cell.display(text: "Code Of Conduct")
            return cell
        case.beyond:
            let cell: VenueAbstractRow = collectionView.dequeueCell(for: indexPath)
            cell.display(text: "Beyond")
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view: VenueHeaderView = collectionView.dequeueSupplementaryView(ofKind: kind, for: indexPath)
            return view
        case UICollectionView.elementKindSectionFooter:
            let view: VenueFooterView = collectionView.dequeueSupplementaryView(ofKind: kind, for: indexPath)
            return view
        default:
            fatalError()
        }
    }
    
    private func makeNewLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 24
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self  else { return nil }
            let section = VenueSection.allCases[sectionIndex]
            switch section {
            case .map:
                return self.layoutFactory.createMapSection()
            case .checkIn:
                return self.layoutFactory.createAbstractSection()
            case .codeOfConduct:
                return self.layoutFactory.createAbstractSection()
            case.beyond:
                return self.layoutFactory.createAbstractSection()
            }
        }
        layout.configuration = config
        return layout
    }
}

