//
//  ProfilePresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol ProfilePresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class ProfilePresenter {
    weak var view : ProfileView?
    var router : ProfileRouting?
    var interactor : ProfileUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : ProfileView, router : ProfileRouting, interactor : ProfileUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  ProfilePresenter: ProfilePresentation{
    
}
