//
//  RoundedConerUIImageView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

@IBDesignable
class RoundedConerUIImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 2 {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowOffsetWidth: Int = 0 {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowOffsetHeight: Int = 2 {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = UIColor.black {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.3 {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var borderColor : UIColor = .black {
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var isCircle : Bool = false {
        didSet{
            layoutSubviews()
        }
    }
    
    override public func layoutSubviews() {
        layer.cornerRadius = isCircle ? frame.size.height / 2 : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        super.layoutSubviews()
    }
    
}
