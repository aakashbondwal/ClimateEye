//
//  SunMoreInfoView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI

struct SunMoreInfoView: View {
    
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    
    
    var body: some View {
        
        ScrollView {
            
            
            VStack(spacing: 20) {
                
                //detailed
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
                        
                        Text("More Details".uppercased())
                            .foregroundStyle(.secondary)
                            .font(.system(size: 14))
                            .bold()
                        
                        Spacer()
                    }
                    
                    
                    Divider()
                    
                    HStack{
                        
                        
                        VStack(alignment: .leading, spacing: 24) {
                            
                            HStack {
                                Text("Sun Rise")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.todaySunRise)
                            }
                            
                            
                            HStack {
                                Text("Sun Set")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.todaySunSet)
                            }
                            
                            HStack {
                                Text("Civil Dawn")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunCivilDawn)
                            }
                            
                            
                            HStack {
                                Text("Civil Dusk")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunCivilDusk)
                            }
                            
                            HStack {
                                Text("Astronomical Dawn")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunAstronomicalDawn)
                            }
                            
                            
                            HStack {
                                Text("Astronomical Dusk")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunAstronomicalDusk)
                            }
                            
                            HStack {
                                Text("Nautical Dawn")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunNauticalDawn)
                            }
                            
                            
                            HStack {
                                Text("Natuical Dusk")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunNauticalDusk)
                            }
                            
                            HStack {
                                Text("Solar Noon")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunSolarNoon)
                            }
                            
                            
                            HStack {
                                Text("Solar MidNight")
                                    .bold()
                                
                                Spacer()
                                Text(weatherViewModel.sunSolarMidNight)
                            }
                            
                        }
                        
                        
                        
                        Spacer()
                        
                    }
                    
                }.padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .padding()
                
                
                
                //10 day events
                VStack(spacing: 12) {
                    
                    HStack {
                        Image(systemName: "sun.max.fill")
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
                        
                        
                        
                        
                        Spacer()
                        
                        
                        Text("SunRise")
                        
                        Spacer()
                        
                        Text("Sunset")
                    }.bold()
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    
                    
                    Divider()
                    
                    ForEach(weatherViewModel.tenDaysSunEvents.prefix(10), id:\.self ){sunevents in
                        SunEventsItemView(day: sunevents.day, sunRise: sunevents.sunRise, sunSet: sunevents.sunSet)
                        
                        Divider()
                    }
                    
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding()
                
                
                
                
                
            }
            .font(.system(size: 14))
            .navigationTitle("Sun Events")
            .navigationBarTitleDisplayMode(.large)
            
        }
        
    }
}

struct SunEventsItemView: View {
    let day: String
    let sunRise: String
    let sunSet: String
    
    var body: some View  {
        HStack(spacing: 15){
            
            Text(day)
                .font(.callout)
                .bold()
            
            
            Spacer()
            
            Text(sunRise)
            
            
            
            Spacer()
            
            Text(sunSet)
            
            
            
        }
    }
}
