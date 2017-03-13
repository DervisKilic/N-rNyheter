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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
