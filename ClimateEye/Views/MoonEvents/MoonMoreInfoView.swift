//
//  MoonEventsDetailsView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import SwiftUI
import WeatherKit
import Charts

struct MoonMoreInfoView: View {
    
    @EnvironmentObject var weatherViewModel: WeatherViewModel

    
    var body: some View {

 
                ScrollView {
                    VStack(spacing: 24) {
                        
                        
                        VStack {
                            
                            HStack {
                                Image(systemName: "moonphase.waning.gibbous")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 10, height: 15)
                                    .foregroundStyle(.black)
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                
                                Text("10 Days".uppercased())
                                    .foregroundStyle(.secondary)
                                    .font(.system(size: 14))
                                    .bold()
                                
                                Spacer()
                            }
                            
                            Divider()
                            
                            HStack(spacing: 15) {
                                Text("Day")
                                
                                Text("Phase")
                                
                                
                                Spacer()
                                
                                
                                Text("MoonRise")
                                
                                Spacer()
                                
                                Text("MoonSet")
                            }.bold()
                                .font(.system(size: 16))
                                .foregroundStyle(.gray)
                            
                            
                            Divider()
                            
                            ForEach(weatherViewModel.tenDaysMoonEvents.prefix(10), id:\.self){moonevents in
                                
                                MoonEventsItemView(day: moonevents.day, image: moonevents.symbolName, moonRise: moonevents.moonRise, moonSet: moonevents.moonSet)
                                
                                Divider()
                                
                            }
                            
                            
                            
                            
                            
                        } .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        .padding()
                    
                    
                    
                }
            }.navigationTitle("Moon Events")
                .navigationBarTitleDisplayMode(.large)
        
    }
}

struct MoonEventsItemView: View {
    let day: String
    let image: String
    let moonRise: String
    let moonSet: String
    
    var body: some View  {
        HStack(spacing: 15){
            
            Text(day)
                .font(.callout)
                .bold()
          
            Image(systemName: image)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
            
            Spacer()
            
            Text(moonRise)
            
            
            
            Spacer()
            
            Text(moonSet)
            
            
            
        }.font(.system(size: 14))
    }
}
