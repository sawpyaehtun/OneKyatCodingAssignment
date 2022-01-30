//
//  CardView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

@IBDesignable
class CardView: UIView, UIGestureRecognizerDelegate {

    @IBInspectable var cornerRadius: CGFloat = 2{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var shadowOffsetWidth: Int = 0{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var shadowOffsetHeight: Int = 2{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var shadowColor: UIColor? = UIColor.black{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.3{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var borderColor : UIColor = .black{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var isCircle : Bool = false{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var isGradiant : Bool = false{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var startColor : UIColor = .white{
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var endColor : UIColor = .white{
        didSet {
            layoutSubviews()
        }
    }
    
    // for CardView Gradiend layer
    let gradient: CAGradientLayer = CAGradientLayer()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTapGestures()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public override func layoutSubviews() {
        
        layer.cornerRadius = isCircle ? frame.size.height / 2 : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: isCircle ? frame.size.height / 2 : cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        gradient.frame = bounds
        
        if isGradiant {
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.cornerRadius = isCircle ? frame.size.height / 2 : cornerRadius
            layer.insertSublayer(gradient, at: .zero)
        }
        
        super.layoutSubviews()
    }
    
    func addTapGestures() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        superview?.endEditing(true)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view is CardView
    }
    
    //MARK:- for Gradient
    func applyGradient(colours: [UIColor]) -> Void {
        applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
       
        gradient.cornerRadius = cornerRadius
        gradient.colors = colours.map { $0.withAlphaComponent(0.90).cgColor }
        gradient.locations = locations
        layer.insertSublayer(gradient, at: .zero)
        
    }
    
   
}
