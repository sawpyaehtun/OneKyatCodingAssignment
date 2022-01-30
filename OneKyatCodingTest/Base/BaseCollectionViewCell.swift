//
//  BaseCollectionViewCell.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

class BaseCollectionViewCell: UICollectionViewCell {
    var disposableBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupLanguage()
        setupTest()
        bindData()
    }
    
    func setupUI(){
        
    }
    
    func setupLanguage(){
        
    }
    
    func setupTest(){
        
    }
    
    func bindData(){
        
    }
    
}
