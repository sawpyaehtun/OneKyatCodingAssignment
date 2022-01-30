//
//  MainTabbarViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    
    var homeItem : UITabBarItem?
    var messageItem : UITabBarItem?
    var notificationItem : UITabBarItem?
    var favouriteItem : UITabBarItem?
    var profileItem : UITabBarItem?
    
    var presenter : MainTabbarPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8196078431, green: 0.8274509804, blue: 0.831372549, alpha: 1)
        tabBar.tintColor = .primary_green
        
        
        /* setup viewControllers */
        let homeVC = HomeBuilder().build()
        let homeWithNav = UINavigationController(rootViewController: homeVC)
        
        let messageVC = MessageBuilder().build()
        let messageWithNav = UINavigationController(rootViewController: messageVC)
        
        let notiVC = NotificationBuilder().build()
        let notiWithNav = UINavigationController(rootViewController: notiVC)
        
        let favVC = FavouriteBuilder().build()
        let favWithNav = UINavigationController(rootViewController: favVC)
        
        let profileVC = ProfileBuilder().build()
        let profileWithNav = UINavigationController(rootViewController: profileVC)
        
        
        /* create tabbar items */
        homeItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        messageItem = UITabBarItem(title: "Message", image: UIImage(named: "message"), tag: 1)
        notificationItem = UITabBarItem(title: "Notification", image: UIImage(named: "notification"), tag: 2)
        favouriteItem = UITabBarItem(title: "Favourite", image: UIImage(named: "favourite_filled"), tag: 3)
        profileItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 4)
        
        /* assign tabbar items */
        homeWithNav.tabBarItem = homeItem
        messageWithNav.tabBarItem = messageItem
        notiWithNav.tabBarItem = notificationItem
        favWithNav.tabBarItem = favouriteItem
        profileWithNav.tabBarItem = profileItem
        
        /* setup viewController for tabbar */
        let vcList = [homeWithNav,
                      messageWithNav,
                      notiWithNav,
                      favWithNav,
                      profileWithNav]
        
        /* Add viewController list to Tabbar */
        viewControllers = vcList
        
    }
    
    
    
}

extension MainTabbarViewController :MainTabbarView {
    
}
