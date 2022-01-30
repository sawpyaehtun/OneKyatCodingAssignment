//
//  UITextField + Extension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import UIKit

extension UITextField {
    func placeholderColor(color: UIColor) {
            let attributeString = [
                NSAttributedString.Key.foregroundColor: color.withAlphaComponent(0.6),
                NSAttributedString.Key.font: self.font!
            ] as [NSAttributedString.Key : Any]
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: attributeString)
        }
}

