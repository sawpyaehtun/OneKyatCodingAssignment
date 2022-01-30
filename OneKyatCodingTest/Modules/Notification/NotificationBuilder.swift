//
//  NotificationBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class NotificationBuilder : BaseBuilder {
    let vc = NotificationViewController.init()
    func build() -> UIViewController {
        let router = NotificationRouter(vc: vc)
        let interactor = NotificationInteractor()
        let presenter = NotificationPresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
