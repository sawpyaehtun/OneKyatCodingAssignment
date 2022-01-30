//
//  ProfileBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class ProfileBuilder : BaseBuilder {
    let vc = ProfileViewController.init()
    func build() -> UIViewController {
        let router = ProfileRouter(vc: vc)
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
