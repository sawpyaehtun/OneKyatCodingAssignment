//
//  WebVCBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class WebVCBuilder : BaseBuilder {
    let vc = WebViewController.init()
    func build() -> UIViewController {
        let router = WebVCRouter(vc: vc)
        let interactor = WebVCInteractor()
        let presenter = WebVCPresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
