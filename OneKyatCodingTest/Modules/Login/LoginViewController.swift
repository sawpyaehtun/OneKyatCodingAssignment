//
//  LoginViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var heightConstraintIcons: NSLayoutConstraint!
    @IBOutlet weak var btnLogin: RoundedCornerUIButton!
    @IBOutlet weak var btnAggrementCheckBox: UIButton!
    @IBOutlet weak var btnTermsAndConditions: UIButton!
    @IBOutlet weak var lblTermsAndConditions: UILabel!
    
    var presenter : LoginPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        super.setupUI()
        setupBtnLogin(isEnable: false)
        self.title = "One Kyat"
        heightConstraintIcons.constant = "text".size(withAttributes: [.font : UIFont.Inter.Medium.font(size: 14)]).height
        tfPhone.font = .Inter.Medium.font(size: 14)
        tfPassword.font = .Inter.Medium.font(size: 14)
        btnLogin.titleLabel?.font = .Inter.SemiBold.font(size: 16)
        lblTermsAndConditions.font = .Inter.Medium.font(size: 12)
        btnTermsAndConditions.titleLabel?.font = .Inter.Medium.font(size: 12)
    }
    
    override func bindData() {
        
        super.bindData()
        tfPhone.rx.text.orEmpty.bind{ [unowned self] in
            presenter?.didEditingPhoneNumber(phoneNumber: $0)
        }.disposed(by: disposableBag)
        
        tfPassword.rx.text.orEmpty.bind{[unowned self] in
            presenter?.didEditingPassword(password: $0)
        }.disposed(by: disposableBag)
        
        btnLogin.rx.tap.bind{[unowned self] in
            presenter?.didTapBtnLogin()
        }.disposed(by: disposableBag)
        
        btnTermsAndConditions.rx.tap.bind{[unowned self] in
            presenter?.didTapBtnTermsAndConditions()
        }.disposed(by: disposableBag)
        
        btnAggrementCheckBox.rx.tap.bind{[unowned self] in
            presenter?.didTapBtnCheckBox()
        }.disposed(by: disposableBag)
        
    }
}

// MARK: - View
extension LoginViewController : LoginView{
    
    func setupBtnLogin(isEnable: Bool) {
        btnLogin.alpha = isEnable ? 1.0 : 0.4
        btnLogin.isEnabled = isEnable
    }
    
    func setupBtnCheckBoxTermsAndCondition(isCheck: Bool) {
        btnAggrementCheckBox.tintColor = isCheck ? .primary_green : .lightGray
    }
    
}
