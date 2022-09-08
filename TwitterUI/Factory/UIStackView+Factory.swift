//
//  UIStackView+Factory.swift
//  TwitterUI
//
//  Created by Filip Cecelja on 9/6/22.
//

import Foundation
import UIKit

extension UIStackView {
    static func with() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }
}
