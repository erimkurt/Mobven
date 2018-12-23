//
//  ServiceConstants.swift
//  Mobven
//
//  Created by macbookair on 23.12.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import Foundation

struct Service{
    static var BaseURL = "http://api.openweathermap.org/data"
    static var VersionAPI = "2.5"
}

struct OpenWeatherMap{
    static var Key = "8827fbf408dc7e1418f3c1e84596334c"
}

struct HttpStatus{
    static var Success = "200"
}

public enum Method: String {
    case GET
    case POST
}
