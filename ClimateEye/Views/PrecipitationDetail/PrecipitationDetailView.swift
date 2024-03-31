//
//  PrecipitationDetailView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI
import WeatherKit

struct PrecipitationDetailView: View {

    @Binding var bgColor: Color
    @EnvironmentObject var weatherViewModel: WeatherViewModel

    var body: some View {

            VStack {
                HStack {
                    Image(systemName: "umbrella.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 15)
                        .foregroundStyle(.black)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    Text("Precipitation".uppercased())
                        .foregroundStyle(.secondary)
                        .font(.system(size: 14))
                        .bold()
                    
                    Spacer()
                }
                
                Divider()
                
                
                HStack {
                        
                        VStack(alignment: .leading, spacing: 18){
                            
                            
                            HStack {
                                Text("Precipitation")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.currentPrecipitation)
                            }
                            
                            HStack {
                                Text("Amount")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.currentPrecipitationAmount)
                            }
                            
                            
                            HStack {
                                Text("Chance")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.currentPrecipitationChance)
                            }
                            
                            
                            
                        }
                        
                        Spacer()
                    }

                
            }.padding()
            .background(bgColor)
                .cornerRadius(20)

    }
}



