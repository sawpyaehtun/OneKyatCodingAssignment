//
//  LoginPresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

import RxSwift
import RxRelay

protocol LoginPresentation {
    
    /* fetch data */
    
    /* user interaction */
    func didEditingPhoneNumber(phoneNumber : String)
    func didEditingPassword(password : String)
    func didTapBtnTermsAndConditions()
    func didTapBtnLogin()
    func didTapBtnCheckBox()
}

class LoginPresenter {
    weak var view : LoginView?
    var router : LoginRouting?
    var interactor : LoginUseCase?
    
    let phoneNumberBehaviorRelay = BehaviorRelay<String>(value: "")
    let passwordBehaviorRelay = BehaviorRelay<String>(value: "")
    let isAgreedTermsAndConditionsBehaviorRelay = BehaviorRelay<Bool>(value: false)
    
    var phoneNumber : String = "" {
        didSet {
            checkLoginValid()
        }
    }
    var password : String = ""{
        didSet {
            checkLoginValid()
        }
    }
    var isAgreedTermsAndCons : Bool = false{
        didSet {
            checkLoginValid()
        }
    }
    
    let disposableBag = DisposeBag()
    
    init(view : LoginView, router : LoginRouting, interactor : LoginUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  LoginPresenter: LoginPresentation{
    func didEditingPassword(password: String) {
        self.password = password
    }
    
    func didTapBtnTermsAndConditions() {
        router?.navigateToWebViewScreen(urlString: "https://www.onekyat.com", titleString: "One Kyat")
    }
    
    func didTapBtnLogin() {
        let corretPhone = "09420000001"
        let correctPassword = "123$#"
        
        if phoneNumber != corretPhone || password != correctPassword {
            view?.showToast?(message: "Phone number or password is incorrect!")
        } else {
            router?.presentMainTabbarScreen()
        }
    }
    
    func didTapBtnCheckBox() {
        isAgreedTermsAndCons.toggle()
        view?.setupBtnCheckBoxTermsAndCondition(isCheck: isAgreedTermsAndCons)
    }
    
    func didEditingPhoneNumber(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
}

extension LoginPresenter {
    private func checkLoginValid(){
        if !phoneNumber.isEmpty,
           !password.isEmpty,
           isAgreedTermsAndCons,
           phoneNumber.isValidPhone(){
            view?.setupBtnLogin(isEnable: true)
        } else {
            view?.setupBtnLogin(isEnable: false)
        }
    }
}
