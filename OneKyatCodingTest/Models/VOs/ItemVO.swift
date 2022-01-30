//
//  ItemVO.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

struct ItemVO {
    let id : Int?
    let name : String?
    let price : Int?
    let image : String?
    let desc : String?
    let seller : SellerVO?
}

extension ItemVO {
    func converToRO() -> ItemRO {
        return ItemRO(id: self.id ?? 0,
                      name: self.name ?? "",
                      price: self.price ?? 0,
                      image: self.image ?? "",
                      desc: self.desc ?? "",
                      seller: self.seller?.converToRO())
    }
}
