//
//  FavoriteCustomTableViewCell.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 13/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import UIKit

class FavoriteCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var paper: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var preamble: UITextView!
    var link = ""
    var logoName = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteSwitch.onTintColor = UIColor(red: 0.384, green: 0.662, blue: 1, alpha: 1.0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func favSwitch(_ sender: UISwitch) {
        if sender.isOn{
            favoriteSwitch.isOn = true
            _ = NewsPapers(name: paper.text!, link: link, logo: logoName, isFav: true)
        }else{
            favoriteSwitch.isOn = false
            _ = NewsPapers(name: paper.text!, isFav: false)
        }
        UserDefaults.standard.set(favoriteSwitch.isOn, forKey: paper.text!)
        UserDefaults.standard.synchronize()
    }
}
