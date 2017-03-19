//
//  NewsPapersViewController.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 09/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class NewsPapersViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    
    let defaults = UserDefaults.standard
    var listNewsPaper : [String] = []
    var link = ""
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listNewsPaper = defaults.array(forKey: "newsPapers") as! [String]
        region.text = defaults.string(forKey: "region")!
    }
    override func viewDidAppear(_ animated: Bool) {
        newsTableView.reloadData()
    }
    
    func numberOfSections(newsTableView tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listNewsPaper.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let paper = listNewsPaper[indexPath.row].components(separatedBy: "#")
        
        cell.logo.image = UIImage(named: paper[0])
        cell.paper.text = paper[2]
        cell.link = paper[1]
        cell.logoName = paper[0]
        cell.favSwitch.isOn = defaults.bool(forKey: paper[2])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        let paper = listNewsPaper[indexPath.row].components(separatedBy: "#")
        link = paper[1]
        
        performSegue(withIdentifier: "s1", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "s1" {
            let webView = segue.destination as! WebViewController
            webView.url = link
        }
    }
}
