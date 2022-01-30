//
//  FavouritePresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol FavouritePresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class FavouritePresenter {
    weak var view : FavouriteView?
    var router : FavouriteRouting?
    var interactor : FavouriteUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : FavouriteView, router : FavouriteRouting, interactor : FavouriteUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  FavouritePresenter: FavouritePresentation{
    
}
