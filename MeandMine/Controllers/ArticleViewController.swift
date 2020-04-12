//
//  ArticleViewController.swift
//  Me and Mine
//
//  Created by Tiara Imani Logan on 4/8/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var loadingSymbol: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.webKitView.navigationDelegate = self
        loadWebView()
    }
    
    var article: Article?
    
    
    func loadWebView () {
        guard let website = self.article?.website, let url = URL(string: website) else {return}
        webKitView.allowsBackForwardNavigationGestures = true
            
        self.webKitView.load(URLRequest(url: url))
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingSymbol.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingSymbol.stopAnimating()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
