//
//  BaseView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

@objc protocol BaseView : AnyObject {
    @objc optional func showLoading()
    @objc optional func hideLoading()
    @objc optional func showToast(message : String)
    @objc optional func showError(error : Error)
}
