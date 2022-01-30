//
//  ItemInfoTableViewCell.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

class ItemInfoTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblItemInfo: UILabel!
    
    override func setupUI() {
        super.setupUI()
        
        lblItemInfo.font = .Inter.Medium.font(size: 14)
    }
    
    func setupCell(info : String){
        lblItemInfo.text = info
        lblItemInfo.setLineSpacing(lineSpacing: 15.0)
    }
    
}
