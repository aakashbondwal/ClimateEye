//
//  WindDetailView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI


struct WindDetailView: View {

    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "wind")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 10, height: 15)
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text("Wind".uppercased())
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
                    .bold()
                
                Spacer()
            }
            
            Divider()
            
            HStack {
                
                VStack(alignment: .leading, spacing: 18){
                    
                    //direction
                    HStack {
                        Text("Wind Direction")
                            .bold()
                        
                        Spacer()
                        Text(weatherViewModel.currentWindDirection)
                    }
                    
                    
                    HStack {
                        Text("Wind Gust")
                            .bold()
                        
                        Spacer()
                        Text(weatherViewModel.currentWindGust)
                    }
                    
                    HStack {
                        Text("Wind Speed")
                            .bold()
                        
                        Spacer()
                        Text(weatherViewModel.currentWindSpeed)
                    }
                    
                    
                }
                
                Spacer()
            }
            
        }.padding()
            .background(bgColor)
        .cornerRadius(20)
        
    }
}

