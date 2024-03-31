//
//  CurrentWeatherView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI


struct CurrentWeatherView: View {

    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var weatherViewModel: WeatherViewModel

    
    var body: some View {
        
        //location and date with time
        
        VStack(spacing: 20){
          
            HStack {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(locationManager.userCity)
                        .font(.title)
                        .bold()
                    
                    Text(weatherViewModel.todayDate)
                        .font(.headline)
                }
                
                Spacer()
                
            }
            
            
            //image ,temp
            
            HStack {

                Image(weatherViewModel.currentDayLight ? weatherViewModel.currentWeatherImage : weatherViewModel.nightCurrentWeatherImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 300)
                
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text(weatherViewModel.currentTemperature)
                        .font(.system(size: 40))
                        .bold()
                    
                    Text(weatherViewModel.currentCondition)
                        .font(.title2)
                    
                    
                    Text(weatherViewModel.currentHighLow)
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.secondary)
                    
                    
                    
                   
                }
                
            }.frame(width: 321, height: 173)
              
        }.padding()
   
    }
}

