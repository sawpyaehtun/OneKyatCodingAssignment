//
//  HomeView.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

protocol HomeView : BaseView {
    func showItemList(itemList : [ItemVO])
    func showBannerSlider(imageList : [String])
    func showLogoutConfirmationAlert()
}

