//
//  WebHelper.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit
import Alamofire

class WebHelper: NSObject {
    
    var pathURL = "http://api.openweathermap.org/data"
    var versionAPI = "2.5"
    var appID = "8827fbf408dc7e1418f3c1e84596334c"
    
    static let sharedInstance: WebHelper = {
        let instance = WebHelper()
        return instance
    } ()
    
    open func getWeatherForecast(cityName: String, success: ((_ response : Any) -> ())? = nil , errorString : ((_ error : String) -> ())? = nil){
        let cityString = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = "\(pathURL)/\(versionAPI)/forecast?q=\(cityString)&units=metric&APPID=\(appID)"
        Alamofire.request(url).responseJSON { response in
            do {
                let jsonData = try JSONDecoder().decode(Weather.self, from: response.data!)
                success!(jsonData)
            } catch {
                errorString!("\(error)")
                print("\(error)")
            }
        }
    }
}
