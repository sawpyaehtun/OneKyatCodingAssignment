//
//  LoginBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class LoginBuilder : BaseBuilder {
    
    let vc = LoginViewController.init()
    func build() -> UIViewController {
        let router = LoginRouter(vc: vc)
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
