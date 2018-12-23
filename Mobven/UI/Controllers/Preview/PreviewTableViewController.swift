//
//  PreviewTableViewController.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class PreviewTableViewController: UITableViewController {

    var contentWeather: Weather!
    var todayWeather: [List] = []
    var startDate: Date!
    var endDate: Date!
    override func viewDidLoad() {
        super.viewDidLoad()
        if (startDate != nil) && (endDate != nil) {
            self.title = "\(startDate.dateToStringWithoutTime())/\(endDate.dateToStringWithoutTime())"
            self.contentWeather.list.forEach{ list in
                var date: Date = Date()
                date.stringToDate(dateString: list.dt_txt)
                
                //Interval Date Counts
                let intervalOfSelect: Int = calculateDaysBetweenTwoDates(start: startDate, end: endDate)
                let intervalOfDate: Int = calculateDaysBetweenTwoDates(start: startDate, end: date)
                
                if intervalOfDate <= intervalOfSelect{
                    todayWeather.append(list)
                }
            }
        }else{
            self.title = contentWeather.city.name
            self.contentWeather.list.forEach{ list in
                let today = Date()
                var date: Date = Date()
                date.stringToDate(dateString: list.dt_txt)
                if date.dateToStringWithoutTime() == today.dateToStringWithoutTime(){
                    todayWeather.append(list)
                }
            }
        }
    }
    
    private func calculateDaysBetweenTwoDates(start: Date, end: Date) -> Int {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: .day, in: .era, for: start) else {
            return 0
        }
        guard let end = currentCalendar.ordinality(of: .day, in: .era, for: end) else {
            return 0
        }
        return end - start
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "timeInterval") {
            let vc = segue.destination as! TimeIntervalViewController
            vc.contentWeather = self.contentWeather
        }
    }
}

//MARK: Table Delegate
extension PreviewTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayWeather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let content: List = todayWeather[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewCell", for: indexPath) as! PreviewTableViewCell
        cell.weatherTitleLabel.text = "\(content.weather[0].main): \(content.weather[0].description)"
        cell.tempLabel.text = "\(content.main.temp)"
        cell.tempMaxMinLabel.text = "\(content.main.temp_max)-\(content.main.temp_min)"
        cell.dateLabel.text = "\(content.dt_txt)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}

extension Date{
    mutating func stringToDate(dateString: String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//2018-09-28 18:00:00
        self = dateFormatter.date(from: dateString)!
    }
    
    func dateToStringWithoutTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.medium
        return dateFormatter.string(from: self)
    }
}
