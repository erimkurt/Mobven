//
//  PreviewTableViewController.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class PreviewTableViewController: UITableViewController {
    
    // IBOutlet
    @IBOutlet weak var tabBarItemRight: UIBarButtonItem!
    
    // Public
    public var contentWeather: Weather!
    public var startDate: Date!
    public var endDate: Date!
    
    // Private
    private var todayWeather: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        self.tabBarItemRight.title = LocalizableStrings.selectDate.localized()
        
        let isDate = (startDate != nil) && (endDate != nil)
        
        self.title = isDate ? "\(startDate.dateToString(dateFormat: DateFormat.kWithoutTimeDateFormat))/\(endDate.dateToString(dateFormat: DateFormat.kWithoutTimeDateFormat))" : contentWeather.city.name
        self.contentWeather.list.forEach{ list in
            let today = Date()
            var date: Date = Date()
            date.stringToDate(dateString: list.dt_txt, dateFormat: DateFormat.kNormalDateFormat)
            
            let isAppend = isDate ? date.isBetweenTwoDates(firstDate: startDate, secondDate: endDate) : date.isEqualTo(today)
            
            if isAppend{
                todayWeather.append(list)
            }
        }
    }
}

// MARK: - Prepare
extension PreviewTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Segue.kTimeInterval) {
            let vc = segue.destination as! TimeIntervalViewController
            vc.contentWeather = self.contentWeather
        }
    }
}

// MARK: - UITableViewDataSource
extension PreviewTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayWeather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.kPreviewTableViewCell, for: indexPath) as! PreviewTableViewCell
        
        if todayWeather.count > indexPath.row {
            let content: List = todayWeather[indexPath.row]
            
            cell.weatherTitleLabel.text = "\(content.weather[0].main): \(content.weather[0].description)"
            cell.tempLabel.text = "\(content.main.temp)"
            cell.tempMaxMinLabel.text = "\(content.main.temp_max)-\(content.main.temp_min)"
            cell.dateLabel.text = "\(content.dt_txt)"
        }
        return cell
    }
}
