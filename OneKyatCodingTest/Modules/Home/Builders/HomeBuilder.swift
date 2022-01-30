//
//  HomeBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class HomeBuilder : BaseBuilder {
    let vc = HomeViewController.init()
    func build() -> UIViewController {
        let router = HomeRouter(vc: vc)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
