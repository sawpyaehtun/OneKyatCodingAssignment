//
//  CircleImageView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

@IBDesignable
open class CircleImageView: UIImageView {
    
    override public func layoutSubviews() {
        layer.cornerRadius = frame.size.height / 2
        super.layoutSubviews()
    }
    
}

