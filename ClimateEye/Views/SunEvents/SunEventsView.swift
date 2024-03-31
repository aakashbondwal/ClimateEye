//
//  SunEventsView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//



import SwiftUI

struct SunEventsView: View {
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel

    var body: some View {
        
        HStack(spacing: 8) {
            
            VStack(spacing: 12) {
                
                Image("SunRise")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .symbolRenderingMode(.multicolor)
                
                Text(weatherViewModel.todaySunRise)
                    .font(.headline)
                    .bold()
                
                Text("SunRise")
                    .foregroundStyle(.secondary)
                
                
            }

            Spacer()
            
            VStack(spacing: 12) {
                
                Image("SunSet 1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .symbolRenderingMode(.multicolor)
                
                Text(weatherViewModel.todaySunSet)
                    .font(.headline)
                    .bold()
                
                Text("SunSet")
                    .foregroundStyle(.secondary)
                
                
            }
            
            
            
        }
        .padding(10)
        .background(bgColor)
        .cornerRadius(20)
    }
}
                
 
