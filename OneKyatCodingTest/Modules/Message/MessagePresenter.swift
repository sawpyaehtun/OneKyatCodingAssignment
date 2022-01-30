//
//  MessagePresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol MessagePresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class MessagePresenter {
    weak var view : MessageView?
    var router : MessageRouting?
    var interactor : MessageUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : MessageView, router : MessageRouting, interactor : MessageUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  MessagePresenter: MessagePresentation{
    
}
