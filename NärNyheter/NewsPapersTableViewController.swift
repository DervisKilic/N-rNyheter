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
        let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let paper = listNewsPaper[indexPath.row].components(separatedBy: "#")
        let link = paper[0]
        
        if let url = URL(string: link){
            myWebView.url = url
        self.present(myWebView, animated: true, completion: nil)
        }
    }
    
}
