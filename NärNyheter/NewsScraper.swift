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
    
    func getScrapedData(url: String, cell: FavoriteCustomTableViewCell){
        
        Alamofire.request(url).responseString { response in
            if let html = response.result.value {
                if let paper = Kanna.HTML(html: html, encoding: String.Encoding.utf8){
                    
                    let unformatedpreamble = paper.xpath("//div/article/div/section/p[@class='p-summary leadin']/a")
                    let header = unformatedpreamble.first?["title"]
                    let preamble = unformatedpreamble.first?.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    DispatchQueue.main.async {

                    cell.heading.text = header
                    cell.preamble.text = preamble
                    }
                    
                    
                }
            }
        }
    }
}
