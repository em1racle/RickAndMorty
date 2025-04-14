//
//  UIView+Extension.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 13.04.2025.
//

import UIKit

extension UIView {
    /// Add multiple subviews
    /// - Parameter views: Variadic views
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
