//
//  BaseViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNavigationColor()
        setupLanguage()
        bindData()
        setupTest()
        addTapGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkViewControllerAndShowHideTabbar()
        checkViewControllerAndAddBackBtn()
    }
    
    func setNavigationColor(){
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .primary_green
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        } else if let navigationBar = navigationController?.navigationBar {
            
            let navigationLayer = CALayer()
            var bounds = navigationBar.bounds
            bounds.size.height += view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            navigationLayer.frame = bounds
            navigationLayer.backgroundColor = UIColor.primary_green.cgColor

            if let image = getImageFrom(layer: navigationLayer) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        }
        
        
    }
    
    func addTapGestures() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        tap.delegate = self
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func addBackButton() {
        
        let backBtn = UIButton(type: .custom)
        backBtn.setBackgroundImage(UIImage(named: "navigation_back_icon"), for: .normal)
        
        if is_iPadDevice() {
            backBtn.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
        } else {
            backBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        }
        
        backBtn.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
        backBtn.contentMode = .scaleAspectFit
        backBtn.tintColor = UIColor.white
        let backBarBtnItem = UIBarButtonItem(customView: backBtn)
        navigationItem.leftBarButtonItem = backBarBtnItem
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func didTapBackBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc  func didTapView(){
        view.endEditing(true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupUI(){
        
    }
    
    func isHiddenTabbar(isHidden : Bool){
        tabBarController?.tabBar.isHidden = isHidden
    }
    
    func checkViewControllerAndShowHideTabbar(){
        let isTopVC : Bool = isTopViewController()
        isHiddenTabbar(isHidden: !isTopVC)
    }
    
    func checkViewControllerAndAddBackBtn() {
        if !isTopViewController(){
            addBackButton()
        }
    }
    
    func isTopViewController() -> Bool{
        return navigationController?.children.first == self
    }
    
    func setupLanguage(){
        
    }
    
    func bindData() {
        
    }
    
    func reloadScreen() {
        setupUI()
        
    }
    
    func setupTest(){
        
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        touch.view == view
    }
}

extension BaseViewController : BaseView {
    func showToast(message: String) {
        presentToast(message: message)
    }
}
