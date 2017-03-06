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
    let regionRadius = 300.0
    let news = NewsPapers()
    var pos = ""
    var papers : [String] = []
    
    
    func getRegion(){
        manager.delegate = self
        manager.requestLocation()
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            

            let posLat = location.coordinate.latitude
            let posLong = location.coordinate.longitude
            
            print("Latitude: \(posLat)")
            print("Longitude \(posLong)")
            
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location, completionHandler: { (position, e) -> Void in
                if e != nil {
                    print("Error:  \(e?.localizedDescription)")
                } else {
                    if let myPosition = position?.first?.administrativeArea?.description{
                    
                        self.pos = myPosition
                    print("Location:  \(myPosition)")
                        
                    }
                    
                    if let p1 = self.news.newsPapers[self.pos]{
                        self.papers = p1
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
