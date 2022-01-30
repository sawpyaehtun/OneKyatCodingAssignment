//
//  MessageBuilder.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

class MessageBuilder : BaseBuilder {
    let vc = MessageViewController.init()
    func build() -> UIViewController {
        let router = MessageRouter(vc: vc)
        let interactor = MessageInteractor()
        let presenter = MessagePresenter(view: vc, router: router, interactor: interactor)
        vc.presenter = presenter
        return vc
    }
}
