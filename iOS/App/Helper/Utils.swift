//
//  Utils.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

//typealias Strings = L10n
//typealias Images = Asset

typealias VoidClosure = () -> Void
typealias BoolClosure = (Bool) -> Void
typealias StringClosure = (String) -> Void
typealias IntClosure = (Int) -> Void
typealias DoubleClosure = (Double) -> Void
typealias FloatClosure = (Float) -> Void

func onMainQueue(after delay: DispatchTimeInterval? = nil, _ block: @escaping VoidClosure) {
    
    if let _delay = delay {
        DispatchQueue.main.asyncAfter(deadline: .now() + _delay, execute: block)
    } else {
        DispatchQueue.main.async(execute: block)
    }
}

func onBackgroundQueue(after delay: DispatchTimeInterval? = nil, _ block: @escaping VoidClosure) {
    if let _delay = delay {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + _delay, execute: block)
    } else {
        DispatchQueue.global(qos: .background).async(execute: block)
    }
    
}

struct Utils {
    
    static var defaultDateFormat: String { return "yyyy-MM-dd" }
    
    static let defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = defaultDateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter
    }()
    
    static func className(for _class: AnyClass) -> String {
        let str = String(describing: type(of: _class))
        guard str.hasSuffix(".Type") else {
            return str
        }
        return String(str[..<str.index(str.endIndex, offsetBy: -5)])
    }
    
    static let defaultJSONDecoder = JSONDecoder()
    static let defaultJSONEncoder = JSONEncoder()
}
