//
//  LoginView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

protocol LoginView : BaseView {
    func setupBtnLogin(isEnable : Bool)
    func setupBtnCheckBoxTermsAndCondition(isCheck : Bool)
}

