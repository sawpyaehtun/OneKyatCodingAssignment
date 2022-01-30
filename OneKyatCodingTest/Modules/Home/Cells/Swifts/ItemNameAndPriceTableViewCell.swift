//
//  ItemNameAndPriceTableViewCell.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

class ItemNameAndPriceTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func setupUI() {
        lblItemName.font = .Inter.SemiBold.font(size: 14)
        lblPrice.font = .Inter.Medium.font(size: 14)
    }
    
    func setupCell(name : String, price : Int){
        lblItemName.text = name
        lblPrice.text = price.commaRepresentation(unit: .Kyats)
    }
    
}
