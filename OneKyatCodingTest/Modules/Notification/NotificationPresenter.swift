//
//  NotificationPresenter.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol NotificationPresentation {
    
    /* fetch data */
    
    /* user interaction */
    
}

class NotificationPresenter {
    weak var view : NotificationView?
    var router : NotificationRouting?
    var interactor : NotificationUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : NotificationView, router : NotificationRouting, interactor : NotificationUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  NotificationPresenter: NotificationPresentation{
    
}
