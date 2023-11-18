//
//  ModelData.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 18/11/23.
//

import Foundation

final class ModelData: ObservableObject {
    var dayWeather: Weather = load("day_weather.json")
    var nightWeather: Weather = load("night_weather.json")
    var dayWeekdaysWeather: [WeekdayWeather] = load("day_weekdays.json")
    var nightWeekdaysWeather: [WeekdayWeather] = load("night_weekdays.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


