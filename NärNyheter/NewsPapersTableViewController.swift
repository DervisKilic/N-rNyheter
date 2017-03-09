//
//  NewsPapersTableViewController.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class NewsPapersTableViewController: UITableViewController {

    let defaults = UserDefaults.standard
    var listNewsPaper : [String] = []
    var link = ""
    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listNewsPaper = defaults.array(forKey: "newsPapers") as! [String]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listNewsPaper.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let paper = listNewsPaper[indexPath.row].components(separatedBy: "#")
        let name = paper[1]
        
        
        cell.paper.text = name
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
     
        
        let paper = listNewsPaper[indexPath.row].components(separatedBy: "#")
        link = paper[0]
        
        performSegue(withIdentifier: "s1", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "s1" {
        let webView = segue.destination as! WebViewController
            
            if let url = URL(string: link){
                webView.url = url
            }
        }
  
    }
    
    
}
