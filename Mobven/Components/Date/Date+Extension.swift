//
//  Date+Convert.swift
//  Mobven
//
//  Created by macbookair on 23.12.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import Foundation

struct DateLocale{
    static let kUSDateLocale = "en_US_POSIX"
}

struct DateFormat{
    static let kNormalDateFormat = "yyyy-MM-dd HH:mm:ss"
    static let kWithoutTimeDateFormat = "yyyy-MM-dd"
}

extension Date{
    // MARK: - Converter
    mutating func stringToDate(dateString: String, dateFormat: String){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: DateLocale.kUSDateLocale)
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from: dateString) else {
            return
        }
        self = date
    }
    
    func dateToString(dateFormat: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: DateLocale.kUSDateLocale)
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    // MARK: - Calculator
    func isEqualTo(_ date: Date) -> Bool {
        return self.dateToString(dateFormat: DateFormat.kWithoutTimeDateFormat) == date.dateToString(dateFormat: DateFormat.kWithoutTimeDateFormat)
    }
    
    func isGreaterThan(_ date: Date) -> Bool {
        return self > date
    }
    
    func isSmallerThan(_ date: Date) -> Bool {
        return self < date
    }
}
