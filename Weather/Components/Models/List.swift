//
//  List.swift
//  Weather
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class List: Decodable {
    var dt: Int
    var main: ListMain
    var weather: [ListWeather]
    var clouds: ListClouds
    var wind: ListWind
    var sys: ListSys
    var dt_txt: String
}
