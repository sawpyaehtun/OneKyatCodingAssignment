//
//  HomeRouter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import UIKit

protocol HomeRouting {
    func navigateToItemDetail(item : ItemVO)
    func presentLoginScreen()
}

class HomeRouter {
    weak var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  HomeRouter: HomeRouting{
    func navigateToItemDetail(item: ItemVO) {
        let itemDetailBuilder = ItemDetailBuilder()
        itemDetailBuilder.vc.item = item
        let itemDetailVC = itemDetailBuilder.build()
        vc?.navigationController?.pushViewController(itemDetailVC, animated: true)
    }
    
    func presentLoginScreen() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let loginVC = LoginBuilder().build()
        let initialViewController = UINavigationController(rootViewController: loginVC)
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
    }
}
