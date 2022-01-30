//
//  UIViewController + Extension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

extension UIViewController {
    func presentToast(message : String ,
                   bottomConstraint : CGFloat = 0,
                   isShowing : ( () -> Void)? = nil ,
                   completion : ( () -> Void)? = nil) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.numberOfLines = 0
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        let maximumLabelSize: CGSize = CGSize(width: 280, height: 300)
        let expectedLabelSize: CGSize = toastLabel.sizeThatFits(maximumLabelSize)
        var newFrame: CGRect = toastLabel.frame
        newFrame.size.height = expectedLabelSize.height + 10
        newFrame.size.width = expectedLabelSize.width + 40
        newFrame.origin.y = UIScreen.main.bounds.height - newFrame.size.height - (UIScreen.main.bounds.height / 9) - bottomConstraint
        newFrame.origin.x = UIScreen.main.bounds.width/2 - (newFrame.size.width/2)
        toastLabel.frame = newFrame
        toastLabel.clipsToBounds  =  true
            
            if #available(iOS 13.0, *) {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
                
                keyWindow?.addSubview(toastLabel)
            } else {
                let window = UIApplication.shared.keyWindow
                window?.addSubview(toastLabel)
            }
            
            UIView.animate(withDuration: 3, delay: 0.5, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
                if let showing = isShowing {
                    showing()
                }
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
                if let completion = completion {
                    completion()
                }
            })
    }
    
    func getImageFrom(layer : CALayer) -> UIImage? {
        var navigateionImage:UIImage?
        UIGraphicsBeginImageContext(layer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            navigateionImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return navigateionImage
    }
}

