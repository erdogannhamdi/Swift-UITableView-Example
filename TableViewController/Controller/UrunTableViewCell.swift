//
//  UrunTableViewCell.swift
//  TableViewController
//
//  Created by Apple on 25.06.2020.
//  Copyright © 2020 erdogan. All rights reserved.
//

import UIKit

class UrunTableViewCell: UITableViewCell {

    @IBOutlet weak var sehirId: UILabel!
    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var imgResim: UIImageView!
    @IBOutlet weak var urunSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
