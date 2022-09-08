//
//  UIImageView.swift
//  TwitterUI
//
//  Created by Filip Cecelja on 9/6/22.
//

import Foundation
import UIKit

extension UIImageView {
    static func with(imageResource: String) -> UIImageView {
        let image = UIImage(named: imageResource)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
