//
//  WebViewController.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let completeURL = URL(string: "http://www.\(url)")
        let URLRequests = URLRequest(url: completeURL!)
        webView.loadRequest(URLRequests)
    }
}
