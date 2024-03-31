//
//  PressureChartView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI
import Charts

struct PressureChartView: View {
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "gauge.low")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 10, height: 15)
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("Pressure".uppercased())
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
                    .bold()
                
                
                
                Spacer()
                
            }
            
            Chart {
                
                ForEach(weatherViewModel.hourlyPressure.prefix(7), id: \.self) {pressures in
                    
                    BarMark(x: .value("Hour", pressures.hour), y: .value("Pressure", pressures.value))
                    
                }
            }

          
        }.padding()
            .background(bgColor)
            .cornerRadius(20)
    }
    
}
