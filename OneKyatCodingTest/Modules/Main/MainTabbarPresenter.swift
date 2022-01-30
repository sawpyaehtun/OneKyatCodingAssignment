//
//  MainTabbarPresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol MainTabbarPresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class MainTabbarPresenter {
    weak var view : MainTabbarView?
    var router : MainTabbarRouting?
    var interactor : MainTabbarUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : MainTabbarView, router : MainTabbarRouting, interactor : MainTabbarUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  MainTabbarPresenter: MainTabbarPresentation{
    
}
