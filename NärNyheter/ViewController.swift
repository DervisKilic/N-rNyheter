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
    let g1 = GPSHelper()
    
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var favorites: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.layer.cornerRadius = 5
        search.layer.borderWidth = 2
        search.layer.borderColor = UIColor.white.cgColor
        favorites.layer.cornerRadius = 5
        favorites.layer.borderWidth = 2
        favorites.layer.borderColor = UIColor.white.cgColor
    }

    override func viewWillAppear(_ animated: Bool) {
        g1.getRegion()
    }
}

