//
//  AppDelegate.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        IQKeyboardManager.shared.enable = true
        
        /*-- setup userDefault inial value */
        UserDefaults.standard.register(defaults: [
            UserDefaultManager.Key.IS_FIRST_TIME_USE.getKey() : true,
        ])
        
        if UserModel.shared.getIsFirstTimeUse() {
            setupData()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    private func setupData(){
        for i in 1...200 {
            let item = ItemVO(id: i,
                              name: "Product \(i)",
                              price: i * 10000,
                              image: "car", desc: "Redmi Note 9 4/64\nGlobal Version\nOfficial Warranty ၄ လကျော်\nError ကင်း အလုံးသန့်\n98% like new\nRedmi Note 9 4/64\nGlobal Version\nOfficial Warranty ၄ လကျော်\nError ကင်း အလုံးသန့်\n98% like new\nRedmi Note 9 4/64\nGlobal Version\nOfficial Warranty ၄ လကျော်\nError ကင်း အလုံးသန့်\n98% like new\nRedmi Note 9 4/64\nGlobal Version\nOfficial Warranty ၄ လကျော်\nError ကင်း အလုံးသန့်\n98% like new\nRedmi Note 9 4/64\nGlobal Version\nOfficial Warranty ၄ လကျော်\nError ကင်း အလုံးသန့်\n98% like new",
                              seller: SellerVO(id: i, name: "Seller Number \(i)", image: "seller_img", account: "@seller\(i)", address: "ရန်ကုန်တိုင်း၊ ရန်ကုန်မြို့။"))
            ItemModel.shared.saveItem(item: item)
            
        }
        
        UserModel.shared.setIsFirstTimeUse(isFirstTime: false)
    }
}
