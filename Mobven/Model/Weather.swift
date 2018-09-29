//
//  Weather.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class Weather: Decodable {
    var cod: String
    var message: Float
    var cnt: Int
    var list: [List]
    var city: City
}
