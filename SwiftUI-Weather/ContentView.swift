//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "São Paulo, SP")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 36)
                HStack(spacing: 20) {
                    WheaterDayView(dayOfWeek: "TUE", 
                                   imageName: isNight ?  "cloud.moon.rain.fill" : "cloud.sun.rain.fill",
                                   temperature: 33)
                    WheaterDayView(dayOfWeek: "WED", 
                                   imageName: isNight ? "cloud.fill" : "cloud.fill",
                                   temperature: 30)
                    WheaterDayView(dayOfWeek: "THU", 
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 34)
                    WheaterDayView(dayOfWeek: "FRI", 
                                   imageName: isNight ? "cloud.moon.bolt.fill" :  "sun.max.fill",
                                   temperature: 38)
                    WheaterDayView(dayOfWeek: "SAT", 
                                   imageName: isNight ? "moon.fill" :  "sun.max.fill",
                                   temperature: 37)
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
                .renderingMode(.original)
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
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: isNight ? [.black, .gray] : [.blue,Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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

