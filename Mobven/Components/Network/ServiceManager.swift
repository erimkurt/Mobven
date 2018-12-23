//
//  WebHelper.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {
    static let sharedInstance: ServiceManager = {
        let instance = ServiceManager()
        return instance
    } ()
    
    open func getWeatherForecast(cityName: String, success: ((_ response : Any) -> ())? = nil , errorString : ((_ error : String) -> ())? = nil){
        let cityString = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = "\(Service.BaseURL)/\(Service.VersionAPI)/forecast?q=\(cityString)&units=metric&APPID=\(OpenWeatherMap.Key)"
        Alamofire.request(url).responseJSON { response in
            do {
                let jsonData = try JSONDecoder().decode(Weather.self, from: response.data!)
                
                if jsonData.cod == HttpStatus.Success {
                    //Success
                    success!(jsonData)
                }else{
                    //Not Found
                    errorString!("\(jsonData)")
                }
            } catch {
                //Not Found
                errorString!("\(error)")
                print("\(error)")
            }
        }
    }
}
