//
//  ItemDetailBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class ItemDetailBuilder : BaseBuilder {
    let vc = ItemDetailViewController.init()
    func build() -> UIViewController {
        let router = ItemDetailRouter(vc: vc)
        let interactor = ItemDetailInteractor()
        let presenter = ItemDetailPresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
