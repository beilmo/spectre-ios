//
//  NibIdentifiable.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

protocol NibIdentifiable {
    static var nibName: String { get }
    static var nib: UINib? { get }
}

extension NibIdentifiable where Self: UIView  {
    static var nibName: String {
        String(describing: self)
    }

    static var nib: UINib? {
        UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}

protocol ReuseIdentifiable {
    static var defaultIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var defaultIdentifier: String {
        String(describing: self)
    }
}

extension UICollectionView {
    func registerCell<T>(_ cell: T.Type) where T: UICollectionViewCell & NibIdentifiable & ReuseIdentifiable {
        if cell.nib != nil {
            register(cell.nib, forCellWithReuseIdentifier: cell.defaultIdentifier)
        } else {
            register(cell.self, forCellWithReuseIdentifier: cell.defaultIdentifier)
        }
    }

    func dequeueCell<T>(for indexPath: IndexPath) -> T where T: UICollectionViewCell & NibIdentifiable & ReuseIdentifiable {
        let candidate = dequeueReusableCell(withReuseIdentifier: T.defaultIdentifier, for: indexPath)

        guard let cell = candidate as? T else {
            fatalError(
                """
                Make sure you've already registered this reuse identifier:\(T.defaultIdentifier),
                for Cell.Type: \(T.self),
                in CollectionView: \(self).
                """
            )
        }

        return cell
    }

    func registerSupplementaryView<T>(_ view: T.Type, ofKind kind: String) where T: UICollectionReusableView & NibIdentifiable & ReuseIdentifiable {
        if view.nib != nil {
            register(view.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: view.defaultIdentifier)
        } else {
            register(view.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: view.defaultIdentifier)
        }
    }

    func dequeueSupplementaryView<T>(ofKind kind: String, for indexPath: IndexPath) -> T where T: UICollectionReusableView & NibIdentifiable & ReuseIdentifiable {
        let candidate = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultIdentifier, for: indexPath)

        guard let view = candidate as? T else {
            fatalError(
                """
                Make sure you've already registered this reuse identifier:\(T.defaultIdentifier),
                for ReusableView.Type: \(T.self),
                in CollectionView: \(self).
                """
            )
        }

        return view
    }
}

extension UITableView {
    func registerCell<T>(_ cell: T.Type) where T: UITableViewCell & NibIdentifiable & ReuseIdentifiable {
        if cell.nib != nil {
            register(cell.nib, forCellReuseIdentifier: cell.defaultIdentifier)
        } else {
            register(cell.self, forCellReuseIdentifier: cell.defaultIdentifier)
        }
    }

    func dequeueCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell & NibIdentifiable & ReuseIdentifiable {
        let candidate = dequeueReusableCell(withIdentifier: T.defaultIdentifier, for: indexPath)

        guard let cell = candidate as? T else {
            fatalError(
                """
                Make sure you've already registered this reuse identifier:\(T.defaultIdentifier),
                for Cell.Type: \(T.self),
                in TableView: \(self).
                """
            )
        }

        return cell
    }
}
