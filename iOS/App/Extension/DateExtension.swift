//
//  DateExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(withFormat format: String = "M/dd/yyyy",
                  timeZone: TimeZone? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let tz = timeZone {
            dateFormatter.timeZone = tz
        }
        return dateFormatter.string(from: self)
    }
}
