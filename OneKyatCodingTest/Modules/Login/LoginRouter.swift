//
//  LoginRouter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

import UIKit

protocol LoginRouting {
    func navigateToWebViewScreen(urlString : String, titleString : String)
    func presentMainTabbarScreen()
}

class LoginRouter {
    weak var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  LoginRouter: LoginRouting{
    
    func navigateToWebViewScreen(urlString: String, titleString: String) {
        let webViewBuilder = WebVCBuilder()
        webViewBuilder.vc.urlString = urlString
        webViewBuilder.vc.titleString = titleString
        let webVC = webViewBuilder.build()
        vc?.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func presentMainTabbarScreen() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let mainTabbarVC = MainTabbarBuilder().build()
        window!.rootViewController = mainTabbarVC
        window!.makeKeyAndVisible()
    }
    
}
