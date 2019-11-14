//
//  ReusableComponents.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

extension UIFont {
    /// Returns an instance of the system font for the specified text style and weight, being scaled appropriately for the user's selected content size category.
    /// - Parameter style: The text style for which to return a font. See "Text Styles” in UIFontDescriptor for recognized values.
    /// - Parameter weight: The weight of the font, specified as a font weight constant. For a list of possible values, see "Font Weights” in UIFontDescriptor. Avoid passing an arbitrary floating-point number for weight, because a font might not include a variant for every weight.
    /// - Returns: The system font associated with the specified text style.
    
    public class func preferredFont(forTextStyle style: UIFont.TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}
