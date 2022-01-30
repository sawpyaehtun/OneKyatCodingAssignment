//
//  MainTabbarBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class MainTabbarBuilder : BaseBuilder {
    let vc = MainTabbarViewController.init()
    func build() -> UIViewController {
        let router = MainTabbarRouter(vc: vc)
        let interactor = MainTabbarInteractor()
        let presenter = MainTabbarPresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
