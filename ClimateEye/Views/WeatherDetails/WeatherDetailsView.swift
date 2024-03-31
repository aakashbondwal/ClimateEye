//
//  WeatherDetailsView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
           
            HStack {
                
                DetailsItemView(image: "sun.max.fill", mainTitle: "UV Index", value: weatherViewModel.currentUVIndex)
                
                
                Spacer()
                
                DetailsItemView(image: "wind", mainTitle: "Feels like", value: weatherViewModel.currentFeelsLike)
                
                Spacer()
                
                DetailsItemView(image: "thermometer.sun.fill", mainTitle: "Dew Point", value: weatherViewModel.currentDewPoint)
                
                
            }
            .padding()
            
            HStack{
                
                DetailsItemView(image: "humidity", mainTitle: "Humidity", value: weatherViewModel.currentHumidity)
                
                Spacer()
                
                DetailsItemView(image: "eye", mainTitle: "Visiblity", value: weatherViewModel.currentVisiblity)
                
                Spacer()
                
                DetailsItemView(image: "gauge.low", mainTitle: "Pressure", value: "\(weatherViewModel.currentPressure) psi")
                
            }
            .padding()
            
            
        }.padding()
            .background(bgColor)
            .cornerRadius(20)
            .padding(.horizontal)
        
        
        
    }
}



struct DetailsItemView: View {
    let image: String
    let mainTitle: String
    let value: String
    
    var body: some View {
        
        VStack(spacing: 12) {
            Image(systemName: image)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
            
            
            Text(mainTitle)
                .font(.system(size: 12))
            
            
            Text(value)
                .multilineTextAlignment(.center)
                .font(.headline)
                .bold()
            
        }
        
    }
}
