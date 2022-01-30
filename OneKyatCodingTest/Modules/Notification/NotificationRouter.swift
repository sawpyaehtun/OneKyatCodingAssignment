//
//  NotificationRouter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

protocol NotificationRouting {
}

class NotificationRouter {
    weak var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  NotificationRouter: NotificationRouting{
}
