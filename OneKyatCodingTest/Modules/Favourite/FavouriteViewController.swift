//
//  FavouriteViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

class FavouriteViewController: BaseViewController {
    
    var presenter : FavouritePresentation?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func setupUI() {
        super.setupUI()
        title = "Favourite"
    }


}

// MARK: - View
extension FavouriteViewController : FavouriteView {
    
}
