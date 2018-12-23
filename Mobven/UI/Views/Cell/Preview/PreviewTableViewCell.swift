//
//  PreviewTableViewCell.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class PreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherTitleLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempMaxMinLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        weatherTitleLabel.text = "N/A"
        tempLabel.text = "N/A"
        tempMaxMinLabel.text = "N/A"
        dateLabel.text = "N/A"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
