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
    var links: [String] = []
    var link = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favTableView.delegate = self
        favTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favTableView.reloadData()
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
            cell.logoName = favData["logo"] as! String
            self.scrapedData.getScrapedData(url: self.favData["link"] as! String, cell: cell)
            cell.favoriteSwitch.isOn = defaults.bool(forKey: cell.paper.text!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if let cell = favTableView.cellForRow(at: indexPath) as? FavoriteCustomTableViewCell{
        
            self.link = cell.link
            performSegue(withIdentifier: "s2", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webView = segue.destination as? WebViewController {
            if segue.identifier == "s2" {
                webView.url = link
            }
        }
    }
}
