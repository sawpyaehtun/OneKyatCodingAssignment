//
//  SellerRO.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import Foundation
import RealmSwift
import SwiftUI

@objcMembers final class SellerRO : Object {
    
    dynamic var id : Int = 0
    dynamic var name : String = ""
    dynamic var image : String = ""
    dynamic var account : String = ""
    dynamic var address : String = ""
    
    convenience init(id : Int = 0, name : String, image : String, account : String, address : String){
        self.init()
        self.id = id
        self.name = name
        self.image = image
        self.account = account
        self.address = address
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func convertToVO() -> SellerVO {
        return SellerVO(id: self.id, name: self.name, image: self.image, account: self.account, address: self.address)
    }
}

