//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var isNight = false
    
    private var weather: Weather {
        isNight ? modelData.nightWeather : modelData.dayWeather
    }
    
    private var weekdays: [WeekdayWeather] {
        isNight ? modelData.nightWeekdaysWeather : modelData.dayWeekdaysWeather
    }
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: weather.city)
                
                MainWeatherStatusView(imageName: weather.icon, temperature: weather.temperature)
                HStack(spacing: 20) {
                    ForEach(weekdays) { day in
                        WheaterDayView(dayOfWeek: day.weekday,
                                       imageName: day.icon,
                                       temperature: day.temperature)
                    }
                }
                Spacer()
                Button{
                    isNight.toggle()
                    let impact = UIImpactFeedbackGenerator(style: .soft)
                    impact.impactOccurred()
                } label: {
                    WeatherButton(title: "Change day time")
                }
                
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}

struct WheaterDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing: 2) {
            Text(dayOfWeek)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)º")
                .font(.system(size: 28))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .multilineTextAlignment(.center)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding(24)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)º")
                .font(.system(size: 70))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

