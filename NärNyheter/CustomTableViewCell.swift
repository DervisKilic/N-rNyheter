//
//  CustomTableViewCell.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var favSwitch: UISwitch!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var paper: UILabel!
    let defaults = UserDefaults.standard
    var name = ""
    var logoName = ""
    var link = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        favSwitch.onTintColor = UIColor(red: 0.384, green: 0.662, blue: 1, alpha: 1.0)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func favSwitch(_ sender: UISwitch) {
        if sender.isOn{
            favSwitch.isOn = true
            _ = NewsPapers(name: name, link: link, logo: logoName, isFav: true)
        }else{
            favSwitch.isOn = false
            _ = NewsPapers(name: name, isFav: false)
        }
        UserDefaults.standard.set(favSwitch.isOn, forKey: name)
        UserDefaults.standard.synchronize()
    }

}
