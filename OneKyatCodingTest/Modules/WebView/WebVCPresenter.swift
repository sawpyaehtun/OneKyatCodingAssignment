//
//  WebVCPresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol WebVCPresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class WebVCPresenter {
    weak var view : WebVCView?
    var router : WebVCRouting?
    var interactor : WebVCUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : WebVCView, router : WebVCRouting, interactor : WebVCUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  WebVCPresenter: WebVCPresentation{
    
}
