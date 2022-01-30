//
//  FavouriteRouter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

protocol FavouriteRouting {
}

class FavouriteRouter {
    weak var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  FavouriteRouter: FavouriteRouting{
}
