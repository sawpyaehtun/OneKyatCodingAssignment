//
//  NotificationViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    var presenter : NotificationPresentation?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func setupUI() {
        super.setupUI()
        title = "Notification"
    }
}

// MARK: - View
extension NotificationViewController : NotificationView{
    
}
