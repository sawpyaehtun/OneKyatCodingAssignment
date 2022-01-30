//
//  HomePresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol HomePresentation {
    
    /* fetch data */
    func getAllItemList()
    func getSliderImages()
    
    /* user interaction */
    func didTapItem(item : ItemVO)
    func didTapLogout()
    func didConfirmLogout()
}

class HomePresenter {
    weak var view : HomeView?
    var router : HomeRouting?
    var interactor : HomeUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : HomeView, router : HomeRouting, interactor : HomeUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  HomePresenter: HomePresentation{
    func getAllItemList() {
        if let itemList = interactor?.getAllItemList(){
            view?.showItemList(itemList: itemList)
        }
    }
    
    func didTapItem(item: ItemVO) {
        router?.navigateToItemDetail(item: item)
    }
    
    func didTapLogout(){
        view?.showLogoutConfirmationAlert()
    }
    
    func getSliderImages() {
        if let imageList = interactor?.getSliderImages(){
            view?.showBannerSlider(imageList: imageList)
        }
    }
    
    func didConfirmLogout() {
        router?.presentLoginScreen()
    }
}
