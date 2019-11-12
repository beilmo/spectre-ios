//
//  UIImage+Color.swift
//  Spectre
//
//  Created by Dorin Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

extension UIImage {
    public static func resizableImage(capInsets: UIEdgeInsets, cornerRadius: CGFloat, color: UIColor) -> UIImage? {
        let size = CGSize(width: (cornerRadius * 6),
                          height: (cornerRadius * 6))
        /// The base rectangle of the image.
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)

        /// The graphics context of the image.
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        /// Image that will be retured.
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if cornerRadius > 0 {
            UIGraphicsBeginImageContextWithOptions(size, false, 0)

            UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
            image?.draw(in: rect)

            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }

        return image?.resizableImage(withCapInsets: capInsets)
    }
}
