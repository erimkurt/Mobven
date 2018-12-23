//
//  CityTableViewCell.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cityLabel.text = "N/A"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
