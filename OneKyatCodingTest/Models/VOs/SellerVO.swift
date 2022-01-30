//
//  SellerVO.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation

struct SellerVO {
    let id : Int?
    let name : String?
    let image : String?
    let account : String?
    let address : String?
}

extension SellerVO {
    func converToRO() -> SellerRO {
        return SellerRO(id: self.id ?? 0,
                        name: self.name ?? "",
                        image: self.image ?? "",
                        account: self.account ?? "",
                        address: self.address ?? "")
    }
}
