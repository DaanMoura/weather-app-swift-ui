//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Daniel Moura on 15/11/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color = .black
    var backgroundColor: Color = .white
    
    var body: some View {
        Color.white
        .mask(
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .cornerRadius(10)
                .luminanceToAlpha()
        )
        
    }
}
