//
//  Forecast.swift
//  C4QWeatherApp
//
//  Created by Patrick O'Leary on 10/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

struct Forecast {//TODO: if I have time, refactor using new Codable protocol
    
    let minTempF: Int
    let maxTempF: Int
    let minTempC: Int
    let maxTempC: Int
    let date: Date
    let icon: String
}

extension Forecast {
    init?(dictionary: [String: Any]) {
        //TODO: refactor JSON parse as failable initializer
        self.minTempF = dictionary["minTempF"] as? Int ?? 0
        self.maxTempF = dictionary["maxTempF"] as? Int ?? 0
        self.minTempC = dictionary["minTempC"] as? Int ?? 0
        self.maxTempC = dictionary["maxTempC"] as? Int ?? 0
        self.icon = dictionary["icon"] as? String ?? ""
        let dateString = dictionary["dateTimeISO"] as? String ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        if let date = dateFormatter.date(from: dateString) {
            self.date = date
        } else {
            return nil
        }
        print("NEW FORECAST INITIALIZED FOR DATE: \(self.date)")
    }
}
