//
//  ListMain.swift
//  Weather
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class ListMain: Decodable {
    var temp: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var sea_level: Float
    var grnd_level: Float
    var humidity: Int
    var temp_kf: Float
}
