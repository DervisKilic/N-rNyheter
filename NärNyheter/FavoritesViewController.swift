//
//  FavoritesViewController.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 13/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var favTableView: UITableView!
    let defaults = UserDefaults.standard
    var favData = [String: Any]()
    let scrapedData = NewsScraper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        favTableView.delegate = self
        favTableView.dataSource = self
    }
    
    func numberOfSections(favTableView tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = defaults.array(forKey: "favorites")?.count{
            return count
            
        }else{
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "favcell", for: indexPath) as! FavoriteCustomTableViewCell
        
        if let favs = defaults.array(forKey: "favorites"){
            favData = favs[indexPath.row] as! Dictionary<String,Any>
            cell.paper.text = favData["name"] as? String
            cell.logo.image = UIImage(named: (favData["logo"] as? String)!)
            cell.favoriteSwitch.isOn = defaults.bool(forKey: cell.paper.text!)
            cell.link = self.favData["link"] as! String
            cell.logoName = favData["logo"] as! String
            self.scrapedData.getScrapedData(url: self.favData["link"] as! String, cell: cell)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}
