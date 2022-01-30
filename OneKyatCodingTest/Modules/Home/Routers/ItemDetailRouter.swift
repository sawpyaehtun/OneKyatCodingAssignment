//
//  ItemDetailRouter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

protocol ItemDetailRouting {
}

class ItemDetailRouter {
    weak var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  ItemDetailRouter: ItemDetailRouting{
}
