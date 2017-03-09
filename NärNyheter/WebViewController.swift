//
//  WebViewController.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var url = URL(string: "")
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let URLRequests = URLRequest(url: url!)
        webView.loadRequest(URLRequests)
    }
}
