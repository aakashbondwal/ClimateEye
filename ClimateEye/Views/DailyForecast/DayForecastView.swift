//
//  DayForecastView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.

import SwiftUI
import WeatherKit


struct DaysForecastView: View {
    
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel

    
    var body: some View {
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 15)
                        .foregroundStyle(.black)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    Text("10-Day Forecast".uppercased())
                        .foregroundStyle(.secondary)
                        .font(.system(size: 14))
                        .bold()
                }
                
                ForEach(weatherViewModel.tenDaysForecast.prefix(10), id:\.self) { weather in
                    
                    DaysForecastItemView(day: weather.day,image: weather.symbolName, maxTemp: weather.highTemperature, minTemp: weather.lowTemperature)
                    
                    Divider()
                    
                }
                
                
            }.padding()
            .background(bgColor)
            .cornerRadius(20)
        
    }
    
}



struct DaysForecastItemView: View {
    let day: String
    let image: String
    let maxTemp: String
    let minTemp: String
    var body: some View  {
        HStack(spacing: 8){
         
            Text(day)
                .bold()
     
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 50)
                .padding(.leading, 20)
        
            
            Spacer()
            
            
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 8, height: 8)
                .foregroundStyle(.green)
            
            
            Text(minTemp)
                .bold()
                
                
            
            Divider()
                .rotationEffect(.degrees(180))
            
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 8, height: 8)
                .foregroundStyle(.red)
            
            Text(maxTemp)
                .bold()
               
            
        }
    }
}
