//
//  GPSHelper.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import Foundation
import CoreLocation

class GPSHelper: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let news = NewsPapers()
    var pos = ""
    let defaults = UserDefaults.standard
    var gotLocation = false
    var onDone: (() -> Void)!
    
    func getRegion(){
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.first {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location, completionHandler: { (position, e) -> Void in
                if e != nil {
                    print("Error:  \(e?.localizedDescription)")
                } else {
                    if let myPosition = position?.first?.administrativeArea?.description{
                        self.pos = myPosition
                    }

                    if let p1 = self.news.newsPapers[self.pos]{
                        self.defaults.set(p1, forKey: "newsPapers")
                        self.defaults.set(self.pos, forKey: "region")
                        self.gotLocation = true
                        self.onDone()
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
