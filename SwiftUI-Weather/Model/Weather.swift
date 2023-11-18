//
//  Weather.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 18/11/23.
//

import Foundation

struct Weather: Hashable, Codable {
    var city: String
    var condition: WeatherCondition
    var temperature: Int
    
    var icon: String {
        getConditionIcon(condition: condition)
    }
}
