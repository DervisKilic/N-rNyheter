//
//  NewsScraper.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 13/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import Foundation
import Kanna
import Alamofire

class NewsScraper {
    var googleLink = ""
    func getScrapedData(url: String, cell: FavoriteCustomTableViewCell){
        
        googleLink = ("https://www.google.se/search?q=site:\(url)&tbas=0&tbs=qdr:d,sbd:1&*")
        
        Alamofire.request(googleLink).responseString { response in
            if let html = response.result.value {
                let paper = Kanna.HTML(html: html, encoding: String.Encoding.utf8)
                let unformatedpreamble = paper?.xpath("//a")
                print(unformatedpreamble![29].text!)

                
                if unformatedpreamble?.first?.text! != nil{
                let preamble = unformatedpreamble?[29].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let header = unformatedpreamble?[31].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                cell.heading.text = header
                cell.preamble.text = preamble
                }else{
                    cell.heading.text = "Comming soon"
                    cell.preamble.text = "Comming soon"
                }
            }
        }
    }
}
