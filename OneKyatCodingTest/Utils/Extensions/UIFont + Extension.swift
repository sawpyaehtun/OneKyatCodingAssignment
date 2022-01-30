//
//  UIFont + Extension.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

//Inter

extension UIFont {
    
    public enum Inter: String {
        case Bold = "-Bold"
        case ExtraLight = "-ExtraLight"
        case Medium = "-Medium"
        case Thin = "-Thin"
        case ExtraBold = "-ExtraBold"
        case Black = "-Black"
        case Light = "-Light"
        case SemiBold = "-SemiBold"
        case Regular = "-Regular"
        
        public func font( size: CGFloat, autoAjust: Bool = true) -> UIFont {
            return UIFont.screenAdjustedAppFont(name: "Inter\(self.rawValue)", size: size, autoAjust: autoAjust)
        }
    }
    
    
    class func screenAdjustedAppFont(name: String, size: CGFloat, autoAjust : Bool) -> UIFont {
        
        if !autoAjust { return UIFont(name: name, size: size)! }
        
        /* 1.4 ratio font for tablet ipad sizes**/
        if iOSDeviceSizes.tabletSize.getBool() {
            return UIFont(name: name, size: size * 1.4)!
        }else if iOSDeviceSizes.plusSize.getBool() {
            /* 1.2 ratio font for iphone plus sizes**/
            return UIFont(name: name, size: size * 1.2)!
        }else if iOSDeviceSizes.miniSize.getBool() {
            /* 0.9 ratio font for iphone SE and mini sizes**/
            return UIFont(name: name, size: size * 0.9)!
        }
        
        return UIFont(name: name, size: size)!
    }
    
}

