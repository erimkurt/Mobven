//
//  City.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class City: Decodable {
    var id: Int
    var name: String
    var coord: Coordinate
    var country: String
    var population: Int
}
