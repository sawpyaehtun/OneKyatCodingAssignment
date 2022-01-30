//
//  ProfileRouter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

protocol ProfileRouting {
}

class ProfileRouter {
    weak var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  ProfileRouter: ProfileRouting{
}
