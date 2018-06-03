//
//  TableViewCell.swift
//  GeoCalculator
//
//  Created by Lohith Nimmala on 5/31/18.
//  Copyright © 2018 Jonathan Engelsma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cood: UILabel!
    @IBOutlet weak var coodt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
