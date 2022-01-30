//
//  HomeInteractor.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    func getAllItemList() -> [ItemVO]
    func getSliderImages() -> [String]
}

class HomeInteractor {
    
}

extension HomeInteractor : HomeUseCase {
    func getAllItemList() -> [ItemVO] {
        return ItemModel.shared.getAllItemList()
    }
    
    func getSliderImages() -> [String] {
        return ["banner_one",
                "banner_two",
                "banner_three",
                "banner_four",
                "banner_five",
                "banner_six",
                "banner_seven"]
    }
}
