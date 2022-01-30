//
//  BaseTableViewCell.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit
import RxCocoa
import RxSwift

open class BaseTableViewCell: UITableViewCell {
    
    public var disposableBag = DisposeBag()

    open override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        setupLanguage()
        setupTest()
        bindData()
    }
    
    open func setupUI(){
        selectionStyle = .none
    }
    
    open func setupLanguage(){
        
    }

    open override func prepareForReuse() {
        super.prepareForReuse()
        applyTheme()
    }
    
    func applyTheme(){
        selectionStyle = .none
    }
    
    open func setupTest() {
        
    }
    
    open func bindData() {
        
    }
}
