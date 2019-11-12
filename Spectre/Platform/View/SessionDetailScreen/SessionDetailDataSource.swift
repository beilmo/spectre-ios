//
//  SessionDetailDataSource.swift
//  Spectre
//
//  Created by Dorin Danciu on 12/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

enum SessionDetailSection: String, CaseIterable {
    case topic
    case abstract
    case actions
    case speakers
    case resources
    case tags

    var title: String? {
        switch self {
        case .topic:
            return nil
        case .abstract:
            return nil
        case .actions:
            return nil
        case .speakers:
            return "Speakers"
        case .resources:
            return "Resources"
        case .tags:
            return "Keywords"
        }
    }
}

enum SessionDetailAction: Hashable, CaseIterable {
    case liveQuestions
    case feedbackForm

    var title: String {
        switch self {
        case .liveQuestions:
            return "Ask a question"
        case .feedbackForm:
            return "Review this session"
        }
    }
}

class SessionDetailDataSource: UICollectionViewDiffableDataSource<SessionDetailSection, AnyHashable> {
    private let useCaseFactory: UseCaseFactory
    private let sessionId: Int64

    private var response: SessionDetailResponse! {
        didSet {
            reloadData()
        }
    }

    init(collectionView: UICollectionView, useCaseFactory: UseCaseFactory, sessionId: Int64) {
        self.useCaseFactory = useCaseFactory
        self.sessionId = sessionId

        super.init(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            return SessionDetailCellProvider.shared.dequeueCell(in: collectionView, at: indexPath, for: item)
        })

        self.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let item = self?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.snapshot().sectionIdentifier(containingItem: item) else { return nil }

            return SessionDetailCellProvider.shared.dequeueSuplementaryView(in: collectionView, ofKind: kind, at: indexPath, for: section)
        }
    }

    func load() {
        useCaseFactory.makeSessionUseCase(sessionId).execute { [weak self] (result) in
            guard let self = self else { return }

            guard let newValue = try? result.get() else {
                return
            }

            self.response = newValue
        }
    }

    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<SessionDetailSection, AnyHashable>()

        snapshot.appendSections([.topic])
        snapshot.appendItems([response.topic], toSection: .topic)

        snapshot.appendSections([.abstract])
        snapshot.appendItems([response.abstract], toSection: .abstract)

        snapshot.appendSections([.actions])
        snapshot.appendItems(SessionDetailAction.allCases, toSection: .actions)

        if !response.speakers.isEmpty {
            snapshot.appendSections([.speakers])
            snapshot.appendItems(response.speakers, toSection: .speakers)
        }

        if !response.resources.isEmpty {
            snapshot.appendSections([.resources])
            snapshot.appendItems(response.resources, toSection: .resources)
        }

        if !response.tags.isEmpty {
            snapshot.appendSections([.tags])
            snapshot.appendItems(response.tags, toSection: .tags)
        }

        apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

class SessionDetailCellProvider {
    static let shared = SessionDetailCellProvider()

    func dequeueCell(in collectionView: UICollectionView, at indexPath: IndexPath, for item: AnyHashable) -> UICollectionViewCell? {
        switch item {
        case let item as SessionTopicResponse:
            return configureTopicCell(with: item, for: indexPath, in: collectionView)
        case let item as SessionAbstractResponse:
            return configureAbstractCell(with: item, for: indexPath, in: collectionView)
        case let item as SessionDetailAction:
            return configureActionCell(with: item, for: indexPath, in: collectionView)
        case let item as SessionSpeakerResponse:
            return configureSpeakerCell(with: item, for: indexPath, in: collectionView)
        case let item as SessionTagResponse:
            return configureTagCell(with: item, for: indexPath, in: collectionView)
        default:
            fatalError("unexpected type")
        }
    }

    func configureTopicCell(with response: SessionTopicResponse,
                            for indexPath: IndexPath,
                            in collectionView: UICollectionView) -> SessionDetailTopicRow {
        let cell: SessionDetailTopicRow = collectionView.dequeueCell(for: indexPath)
        cell.display(title: response.title)
        cell.display(subtitle: response.subtitle)
        cell.display(startTime: response.startDate.shortTime())
        cell.display(duration: response.duration.minutes())
        cell.display(room: response.room)

        return cell
    }

    func configureAbstractCell(with response: SessionAbstractResponse,
                               for indexPath: IndexPath,
                               in collectionView: UICollectionView) -> SessionDetailAbstractRow {
        let cell: SessionDetailAbstractRow = collectionView.dequeueCell(for: indexPath)
        cell.display(text: response.text)

        return cell
    }

    func configureActionCell(with item: SessionDetailAction,
                             for indexPath: IndexPath,
                             in collectionView: UICollectionView) -> SessionDetailActionRow {
        let cell: SessionDetailActionRow = collectionView.dequeueCell(for: indexPath)
        cell.display(title: item.title)
        cell.display(image: nil)

        return cell
    }


    func configureSpeakerCell(with response: SessionSpeakerResponse,
                              for indexPath: IndexPath,
                              in collectionView: UICollectionView) -> SessionDetailActionRow {
        let cell: SessionDetailActionRow = collectionView.dequeueCell(for: indexPath)
        cell.display(title: response.firstName + response.lastName)
        cell.display(image: nil)

        return cell
    }

    func configureTagCell(with response: SessionTagResponse,
                          for indexPath: IndexPath,
                          in collectionView: UICollectionView) -> SessionDetailActionRow {
        let cell: SessionDetailActionRow = collectionView.dequeueCell(for: indexPath)
        cell.display(title: response.name)
        cell.display(image: nil)

        return cell
    }

    func dequeueSuplementaryView(in collectionView: UICollectionView,
                                 ofKind kind: String,
                                 at indexPath: IndexPath,
                                 for item: AnyHashable) -> UICollectionReusableView {
        switch item {
        case let item as SessionDetailSection:
            return configureHeaderSupplementaryView(with: item, ofKind: kind, at: indexPath, in: collectionView)
        default:
            fatalError("unexpected type")
        }
    }

    func configureHeaderSupplementaryView(with item: SessionDetailSection,
                                          ofKind kind: String,
                                          at indexPath: IndexPath,
                                          in collectionView: UICollectionView) -> SessionDetailHeaderView {
        let view: SessionDetailHeaderView = collectionView.dequeueSupplementaryView(ofKind: kind, for: indexPath)
        view.display(title: item.title)
        return view
    }

}
