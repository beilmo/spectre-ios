//
//  ActionButton.swift
//  Spectre
//
//  Created by Dorin Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

@IBDesignable
class ActionButton: UIButton {

    // MARK: - Properties

    @IBInspectable
    var backgroundImageColor: UIColor?{
        didSet {
            updateBackgroundImage()
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat = 8 {
        didSet {
            updateBackgroundImage()
        }
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        updateBackgroundImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateBackgroundImage()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateBackgroundImage()
    }

    // MARK: - Private

    private func updateBackgroundImage() {
        let capInsets = UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius)
        let image = UIImage.resizableImage(capInsets: capInsets, cornerRadius: cornerRadius, color: backgroundImageColor ?? tintColor)

        setBackgroundImage(image, for: .normal)
    }


    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if backgroundImageColor == UIColor.systemBackground {
            updateBackgroundImage()
        }
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if backgroundImageColor == nil {
            updateBackgroundImage()
        }
    }
}

