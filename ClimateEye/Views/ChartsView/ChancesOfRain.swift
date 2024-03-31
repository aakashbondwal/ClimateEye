//
//  ChancesOfRain.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI

struct ChancesOfRain: View {

    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack{
            
            HStack {
                Image(systemName: "umbrella.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 10, height: 15)
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("Chances of Rain".uppercased())
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
                    .bold()
                
                Spacer()
            }
            
            Divider()

                ForEach(weatherViewModel.tenDaysChancesOfRain.prefix(8), id: \.self) { hourUV in
                 
                    chanceOfRainItem(day: hourUV.day,  value: hourUV.value)
                    
                    Divider()
                    
                }
           
        }.padding()
            .background(bgColor)
            .cornerRadius(20)
    }
}



struct chanceOfRainItem: View {
    let day: String
    let value: String
    let isValuemore = "0%"
    var body: some View  {
        HStack(spacing: 15){
         
            Text(day)
                .bold()

            Spacer()
            

            
            if isValuemore == value {
                Text(value)
                    .foregroundStyle(.green)
            } else {
                Text(value)
                    .foregroundStyle(.red)
            }
          
        }
    }
}
