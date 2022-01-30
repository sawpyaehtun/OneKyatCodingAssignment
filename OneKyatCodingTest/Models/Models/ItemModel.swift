//
//  ItemModel.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import Foundation

final class ItemModel {
    static let shared : ItemModel = ItemModel()
}

// MARK: - local db
extension ItemModel {
    func saveItem(item : ItemVO){
        DBManager.sharedInstance.saveData(data: item.converToRO(), value: ItemRO.self) { error in
            print(error)
        }
    }
    
    func getAllItemList() -> [ItemVO]{
        let itemROList = DBManager.sharedInstance.getDataFromDB(roName: .ItemRO) as! [ItemRO]
        return itemROList.map{$0.converToVO()}
    }
}
