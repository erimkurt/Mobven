//
//  TimeIntervalViewController.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class TimeIntervalViewController: UIViewController {

    // IBOutlet
    @IBOutlet weak var labelStartDate: UILabel!
    @IBOutlet weak var labelEndDate: UILabel!
    @IBOutlet weak var pickerStartDate: UIDatePicker!
    @IBOutlet weak var pickerEndDate: UIDatePicker!
    @IBOutlet weak var buttonDone: UIButton!
    
    // Public
    public var contentWeather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        self.labelStartDate.text = LocalizableStrings.start.localized()
        self.labelEndDate.text = LocalizableStrings.end.localized()
        self.buttonDone.setTitle(LocalizableStrings.list.localized(), for: .normal)
    }
}

// MARK: - Prepare
extension TimeIntervalViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Segue.kListAccordingToTimeInterval) {
            let vc = segue.destination as! PreviewTableViewController
            vc.contentWeather = self.contentWeather
            vc.startDate = self.pickerStartDate.date
            vc.endDate = self.pickerEndDate.date
        }
    }
}
