//
//  UIViewRounded.swift
//  TwitterUI
//
//  Created by Filip Cecelja on 9/6/22.
//

import Foundation
import UIKit

extension UIView {
    func makeRounded(divideHeightBy: CGFloat) {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height/divideHeightBy
        clipsToBounds = true
    }
}
