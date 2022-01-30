//
//  MessageViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

class MessageViewController: BaseViewController {

    var presenter : MessagePresentation?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupUI() {
        super.setupUI()
        title = "Message"
    }

}

// MARK: - View
extension MessageViewController : MessageView{
    
}
