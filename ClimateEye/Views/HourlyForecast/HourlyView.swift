//
//  HourlyView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI

struct HourlyView: View {
    
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel

    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(weatherViewModel.hourlyForecast.prefix(15), id: \.time) {weather in
                    
                        HourlyItemView(time: weather.time, image: weather.symbolName, temperature: weather.temperature, color: bgColor)
                        
                    }
                }
        }
    }
}




struct HourlyItemView: View {
    let time: String
    let image: String
    let temperature: String
    let color: Color
    var body: some View {
        VStack(spacing: 8){
            Text(time)
                .font(.system(size: 14))

            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 70)
           

            Text(temperature)
                .font(.headline)
                .bold()
            
            
        }.padding()
            .background(color)
            .cornerRadius(50)
    }
}
