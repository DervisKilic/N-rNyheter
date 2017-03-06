//
//  ViewController.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    let g1 = GPSHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        g1.getRegion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

