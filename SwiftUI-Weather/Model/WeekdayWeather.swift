//
//  WeekdayWeather.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 18/11/23.
//

import Foundation

struct WeekdayWeather: Hashable, Codable, Identifiable {
    var weekday: String
    var condition: WeatherCondition
    var temperature: Int
    
    var id: String { weekday }
    var icon: String {
        getConditionIcon(condition: condition)
    }
}
