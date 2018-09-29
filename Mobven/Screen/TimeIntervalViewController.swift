//
//  TimeIntervalViewController.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class TimeIntervalViewController: UIViewController {

    var contentWeather: Weather!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listAccordingToTimeInterval") {
            let vc = segue.destination as! PreviewTableViewController
            vc.contentWeather = self.contentWeather
            vc.startDate = self.startDatePicker.date
            vc.endDate = self.endDatePicker.date
        }
    }
}
