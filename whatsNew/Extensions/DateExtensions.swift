//
//  DateExtensions.swift
//  whatsNew
//
//  Created by HienNN on 14/11/2023.
//

import Foundation

public extension TimeZone {
    static let GMT = TimeZone(secondsFromGMT: 0)!
}

public extension Date.FormatStyle {
    static let gmtDateTime = Date.FormatStyle.dateTime.timeZone(.GMT).year().month().day().hour().minute()
    static let time = Date.FormatStyle.dateTime.hour().minute()
    
    func timeZone(_ timeZone: TimeZone) -> Self {
        var formatStyle = self
        formatStyle.timeZone = timeZone
        return formatStyle
    }
}

public extension Date {
    
}
