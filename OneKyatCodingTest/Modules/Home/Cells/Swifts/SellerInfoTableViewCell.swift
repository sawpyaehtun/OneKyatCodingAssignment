//
//  SellerInfoTableViewCell.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit

class SellerInfoTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var heightConstraintImgLocation: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintImgMood: NSLayoutConstraint!
    @IBOutlet weak var lblSellerName: UILabel!
    @IBOutlet weak var lblSellerAccount: UILabel!
    @IBOutlet weak var lblSellerAddress: UILabel!
    @IBOutlet weak var lblHappyCount: UILabel!
    @IBOutlet weak var lblNotOkCount: UILabel!
    @IBOutlet weak var lblBadCount: UILabel!
    @IBOutlet weak var lblSinceAgo: UILabel!
    @IBOutlet weak var imgSeller: CircleImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupUI() {
        super.setupUI()
        let iconHeight : CGFloat = "text".size(withAttributes: [.font : UIFont.Inter.Medium.font(size: 14)]).height
        heightConstraintImgLocation.constant = iconHeight
        heightConstraintImgMood.constant = iconHeight + 10
        
        lblSellerName.font = .Inter.Bold.font(size: 16)
        lblSellerAccount.font = .Inter.Medium.font(size: 14)
        lblSellerAddress.font = .Inter.Medium.font(size: 12)
        
        lblHappyCount.font = .Inter.Medium.font(size: 12)
        lblNotOkCount.font = .Inter.Medium.font(size: 12)
        lblBadCount.font = .Inter.Medium.font(size: 14)
        lblSinceAgo.font = .Inter.Medium.font(size: 12)
        
    }
    
    func setupCell(seller : SellerVO){
        imgSeller.image = UIImage(named: seller.image ?? "")
        lblSellerName.text = seller.name
        lblSellerAccount.text = seller.account
        lblSellerAddress.text = seller.address
    }
}
