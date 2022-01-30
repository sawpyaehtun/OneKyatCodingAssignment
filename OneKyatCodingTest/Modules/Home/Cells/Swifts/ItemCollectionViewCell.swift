//
//  ItemCollectionViewCell.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import UIKit

class ItemCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setupUI() {
        super.setupUI()
        lblName.font = .Inter.Medium.font(size: 16)
        lblPrice.font = .Inter.Medium.font(size: 14)
    }
    
    func setupItem(image : String, name : String, price : Int){
        imgItem.image = UIImage(named: image)
        lblName.text = name
        lblPrice.text = price.commaRepresentation(unit: .Lakhs)
    }

}
