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
                let paper = Kanna.HTML(html: html, encoding: String.Encoding.utf8)
                
                let unformatedpreamble = paper?.xpath("//article['ltr puff-medium puff-medium--haslink']")
                if unformatedpreamble?.first?.text! != nil{
                let preamble = unformatedpreamble?[1].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let header = unformatedpreamble?[0].text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
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
