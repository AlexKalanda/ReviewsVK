//
//  UIImage+Ext.swift
//  Test
//
//  Created by admin on 2/3/2025.
//

import UIKit

extension UIImage {
    /// Создает фото с нужным `cornerRadius` и обрезает углы 
    func resize(to size: CGSize, cornerRadius: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            path.addClip()
            self.draw(in: rect)
        }
    }
}
