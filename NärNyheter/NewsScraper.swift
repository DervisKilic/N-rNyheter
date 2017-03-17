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
    var unformatedLink = ""
    
    func getScrapedData(url: String, cell: FavoriteCustomTableViewCell){
        googleLink = ("http://www.bing.com/news/search?q=site%3A\(url)&qs")
        Alamofire.request(googleLink).responseString { response in
            if let html = response.result.value {
                let paper = Kanna.HTML(html: html, encoding: String.Encoding.utf8)
                let headerUnformated = paper?.xpath("//*[@id='rtp']/div[1]/div/div[1]/a['href']")
                let linkUnformated = paper?.xpath("//*[@id='rtp']/div[1]/div/div[1]/a/@href")
                
                if headerUnformated?.first?.text! != nil{
                    let header = headerUnformated?[0].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    cell.heading.text = header
                    self.unformatedLink = (linkUnformated?.first?.text!)!
                    cell.link = self.unformatedLink
                    cell.link = cell.link.replacingOccurrences(of: "http://www.", with: "", options: .literal, range: nil)

                }else{
                    cell.heading.text = "Comming soon"
                }
            }
        }
    }
}
