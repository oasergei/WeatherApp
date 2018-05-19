//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Sergey on 14.05.18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
}

extension CurrentWeather: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let temperature = JSON["temperature"] as? Double, let appearentTemperature = JSON["apparentTemperature"] as? Double, let humidity = JSON["humidity"] as? Double, let pressure = JSON["pressure"] as? Double, let iconString = JSON["icon"] as? String else {
            return nil
        }
        
        let icon = WeatherIconManager(rawValue: iconString).image
        
        self.temperature = temperature
        self.appearentTemperature = appearentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.icon = icon
    }
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure * 0.750062)) mm"
    }
    var temperatureString: String {
        return "\(Int(5 / 9 * (temperature - 32)))˚C"
    }
    var apperarentTemperetureString: String {
        return "Feels like: \(Int(5 / 9 * (appearentTemperature - 32)))˚C"
    }
    var humidityString: String {
        return "\(Int(humidity * 100)) mm"
    }
}
