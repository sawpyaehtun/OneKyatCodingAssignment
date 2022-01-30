//
//  ItemDetailPersenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol ItemDetailPresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class ItemDetailPresenter {
    weak var view : ItemDetailView?
    var router : ItemDetailRouting?
    var interactor : ItemDetailUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : ItemDetailView, router : ItemDetailRouting, interactor : ItemDetailUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  ItemDetailPresenter: ItemDetailPresentation{
    
}
