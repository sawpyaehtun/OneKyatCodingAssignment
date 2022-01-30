//
//  WebViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    var urlString : String?
    var titleString : String?
    
    var presenter : WebVCPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: urlString ?? "")!))
    }
    
    override func setupUI() {
        super.setupUI()
        title = titleString ?? ""
        setupLoadingIndicator()
        webView.navigationDelegate = self
        webView.uiDelegate = self
    }
    
    private func setupLoadingIndicator(){
        view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { indicator in
            indicator.centerX.equalToSuperview()
            indicator.centerY.equalToSuperview()
        }
        loadingIndicator.hidesWhenStopped = true
    }
    
}

// MARK: - delegate and dataSource
extension WebViewController : WKUIDelegate , WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingIndicator.stopAnimating()
    }
}

// MARK: - View
extension WebViewController : WebVCView {
    
}
