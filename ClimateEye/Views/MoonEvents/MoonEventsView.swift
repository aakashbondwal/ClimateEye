//
//  MoonEventsView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI


struct MoonEventsView: View {
    
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        
        
        HStack {
            
            VStack(alignment: .leading, spacing: 20) {
                
                
                
                HStack(spacing: 16) {
                    
                    Text("MoonRise")
                        .bold()
                    
                    
                    Image(systemName: "moonrise.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .symbolRenderingMode(.multicolor)
                    
                    Text(weatherViewModel.todayMoonrise)
                    
                }
                
                HStack(spacing: 16) {
                    
                    Text("MoonSet")
                        .bold()
                    
                    Image(systemName: "moonset.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .symbolRenderingMode(.multicolor)
                    
                    Text(weatherViewModel.todayMoonset)
                }
                
                
                
            }
            
            
            Spacer()
            
            
            VStack {
                
                
                Image(systemName: weatherViewModel.todayMoonPhaseImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 50)
                    .symbolRenderingMode(.multicolor)
                
                
                Text(weatherViewModel.todayMoonPhase)
                
            }
            
            
            
            
            
            
        }   .padding()
            .background(bgColor)
            .cornerRadius(20)
        
        
        
    }
}

