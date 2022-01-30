//
//  FavouriteBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class FavouriteBuilder : BaseBuilder {
    let vc = FavouriteViewController.init()
    func build() -> UIViewController {
        let router = FavouriteRouter(vc: vc)
        let interactor = FavouriteInteractor()
        let presenter = FavouritePresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
