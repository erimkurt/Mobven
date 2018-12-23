//
//  LocalizableManager.swift
//  Mobven
//
//  Created by macbookair on 23.12.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import Foundation

extension String {
    public func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}

public struct LocalizableStrings {
    // Home
    static let searchCity = "search_city"
    
    // Filter
    static let list = "list"
    static let start = "start"
    static let end = "end"
    
    // Preview
    static let selectDate = "select_date"
    
    // Alert
    static let ok = "ok"
    static let error = "error"
    static let notFound = "notFound"
}
