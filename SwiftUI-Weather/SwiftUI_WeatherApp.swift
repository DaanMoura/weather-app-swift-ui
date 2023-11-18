//
//  SwiftUI_WeatherApp.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 08/11/23.
//

import SwiftUI

@main
struct SwiftUI_WeatherApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
