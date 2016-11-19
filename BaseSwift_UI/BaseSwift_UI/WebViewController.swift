//
//  WebViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/16.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit

class WebViewController: UIViewController ,UIWebViewDelegate{

    var webView : UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.title = "WebView"
        
        initWebView()
        
        
    }
    //MARK: ***********创建webView*************
    @discardableResult
    func initWebView() -> UIWebView {
        
        self.webView = UIWebView(frame: self.view.bounds)
        
        self.webView.delegate = self
        
        let urlString = "https://www.baidu.com/"
        
        let url = NSURL(string: urlString)
        
        let  urlRequest = NSURLRequest(url: url as! URL)
        
        self.webView.loadRequest(urlRequest as URLRequest)
        
        self.view.addSubview(self.webView)
        return self.webView
    }
    //MARK: ***********WebViewDelegate**********
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("开始加载...")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("加载完成...")
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("加载失败...")
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}













