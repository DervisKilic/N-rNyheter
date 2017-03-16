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
    let defaults = UserDefaults.standard
    var googleLink = ""
    var test = ""
    func getScrapedData(url: String, cell: FavoriteCustomTableViewCell, link: @escaping (String) -> Void){
        
        googleLink = ("https://www.google.se/search?q=site:\(url)&tbs=qdr%3Ad%2Csbd%3A1&*&rct=j")
        
        Alamofire.request(googleLink).responseString { response in
            if let html = response.result.value {
                let paper = Kanna.HTML(html: html, encoding: String.Encoding.utf8)
                let headerUnformated = paper?.xpath("//*['rso']/h3")
                let preambleUnformated = paper?.xpath("//*['rso']/span")
                let linkUnformated = paper?.xpath("//*['rso']/cite")
                
                for test in headerUnformated!{
                    print(test.text!)
                }
                
                if headerUnformated?.first?.text! != nil{
                let preamble = preambleUnformated?[5].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let header = headerUnformated?[0].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                cell.heading.text = header
                cell.preamble.text = preamble
                
                    self.test = (linkUnformated?.first?.text!)!
                   
                    link(self.test)
                
                }else{
                    cell.heading.text = "Comming soon"
                    cell.preamble.text = "Comming soon"
                }
            }
        }
    }
}
