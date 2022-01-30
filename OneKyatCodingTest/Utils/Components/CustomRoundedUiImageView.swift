//
//  CustomRoundedUiImageView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import UIKit

@IBDesignable // to show in storyBoard
class CustomRoundedUiImageView: UIImageView {
    
    @IBInspectable var topLeftCornerRadius : CGFloat = 2
    @IBInspectable var topRightCornerRadius : CGFloat = 2
    @IBInspectable var bottomLeftCornerRadius : CGFloat = 2
    @IBInspectable var bottomRightCornerRadius : CGFloat = 2
    @IBInspectable var borderWidth :  CGFloat = 0.0
    @IBInspectable var borderColor :  UIColor? = UIColor.black
    
    
    override func layoutSubviews() {

        roundCorners(topLeft: topLeftCornerRadius, topRight: topRightCornerRadius, bottomLeft: bottomLeftCornerRadius, bottomRight: bottomRightCornerRadius)
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        
    }
}
