//
//  ItemRO.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RealmSwift

@objcMembers final class ItemRO : Object{
    dynamic var id : Int = 0
    dynamic var name : String = ""
    dynamic var price : Int = 0
    dynamic var image : String = ""
    dynamic var desc : String = ""
    dynamic var seller : SellerRO?
    
    convenience init(id : Int = 0,name : String, price : Int, image : String,
                     desc : String,
                     seller : SellerRO?){
        self.init()
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        self.desc = desc
        self.seller = seller
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func converToVO() -> ItemVO {
        return ItemVO(id: self.id, name: self.name, price: self.price, image: self.image, desc: self.desc, seller: self.seller?.convertToVO())
    }
}
