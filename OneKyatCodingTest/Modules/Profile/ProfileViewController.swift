//
//  ProfileViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    var presenter : ProfilePresentation?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "Profile"
    }
}

// MARK: - View
extension ProfileViewController : ProfileView{
    
}
