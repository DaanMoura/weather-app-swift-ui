//
//  WeatherCondition.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 18/11/23.
//

import Foundation

enum WeatherCondition: String, Hashable, Codable {
    case sun = "sun"
    case cloudy = "cloudy"
    case sunRain = "sunRain"
    case sunCloudyRain = "sunCloudyRain"
    case cloudyRain = "cloudyRain"
    case moon = "moon"
    case moonCloudy = "moonCloudy"
    case moonCloudyRain = "moonCloudyRain"
    case storm = "storm"
}
    
var conditionToIcon = [
    WeatherCondition.sun: "sun.max.fill",
    WeatherCondition.cloudy: "cloud.fill",
    WeatherCondition.sunRain: "sun.rain.fill",
    WeatherCondition.sunCloudyRain: "cloud.sun.rain.fill",
    WeatherCondition.cloudyRain: "cloud.heavyrain.fill",
    WeatherCondition.moon: "moon.stars.fill",
    WeatherCondition.moonCloudy: "cloud.moon.fill",
    WeatherCondition.moonCloudyRain: "cloud.moon.rain.fill",
    WeatherCondition.storm: "cloud.bolt.rain.fill"
]

func getConditionIcon(condition: WeatherCondition) -> String {
    return conditionToIcon[condition] ?? "cloud.fill"
}
