//
//  UVChartView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import SwiftUI
import Charts

struct UVChartView: View {
  
    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack{
            
            HStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 10, height: 15)
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("UV Index".uppercased())
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
                    .bold()
                
                Spacer()
            }
            
            Chart {
                ForEach(weatherViewModel.hourlyUVIndex.prefix(7), id: \.self) { hourUV in
                    LineMark(x: .value("Hour", hourUV.hour), y: .value("UV Index", hourUV.value))
                    
                }
            }.padding(.bottom, 20)
        }.padding()
            .background(bgColor)
            .cornerRadius(20)
    }
}

