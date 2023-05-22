//
//  GeeksForGeeksWebView.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 12/05/23.
//

import UIKit
import WebKit

class GeeksForGeeksWebView: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak private var webView: WKWebView!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - setupView
extension GeeksForGeeksWebView: WKNavigationDelegate {
    func setupView() {
        webView.navigationDelegate = self
        if let url = URL(string: URL.geeksForGeeks) {
            webView.load(URLRequest(url: url))
        }
        webView.allowsBackForwardNavigationGestures = true
    }
}

//MARK: - UIWebViewDelegate
extension GeeksForGeeksWebView: UIWebViewDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
    }
}

//MARK: - Actions
extension GeeksForGeeksWebView {
    @IBAction private func btnForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    @IBAction private func btnBack(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
