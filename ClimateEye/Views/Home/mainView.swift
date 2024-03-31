//
//  mainView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI
import UserNotifications
import SpriteKit
import WeatherKit


struct mainView: View {
  
    @StateObject private var locationManager = LocationManager()
    @StateObject private var weatherViewModel = WeatherViewModel()
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State private var bgColor: Color = Color(#colorLiteral(red: 0.1824976504, green: 0.1924802363, blue: 0.2307183444, alpha: 1))
    @State private var bgColor1: Color = Color(#colorLiteral(red: 0.3445351422, green: 0.1541474164, blue: 0.3958391249, alpha: 1))
    let colors1 = [Color(#colorLiteral(red: 0.1372542381, green: 0.1372554898, blue: 0.1629073024, alpha: 1)), Color(#colorLiteral(red: 0.1824976504, green: 0.1924802363, blue: 0.2307183444, alpha: 1))]  //nightLight
    let colors = [Color(#colorLiteral(red: 0.3445351422, green: 0.1541474164, blue: 0.3958391249, alpha: 1)), Color(#colorLiteral(red: 0.480399847, green: 0.2106532753, blue: 0.3578186333, alpha: 1))]    //dayLight
    @State var showSpriteKit = false
    var body: some View {

            GeometryReader {geometry in
                
                ZStack {
                  
   
//                    background color
                    if weatherViewModel.currentDayLight == true {
                     
                            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                                .ignoresSafeArea()
                        
                        
                        SpriteView(scene: ClearSky(), options: [.allowsTransparency])
                            .ignoresSafeArea()
                            .opacity(showSpriteKit ? 1 : 0)
                      

                        
                    }
                    else {
                            LinearGradient(colors: colors1, startPoint: .topLeading, endPoint: .bottomTrailing)
                                .ignoresSafeArea()
                        
                        
                        SpriteView(scene: StarsSky(), options: [.allowsTransparency])
                            .ignoresSafeArea()
                            .opacity(showSpriteKit ? 1 : 0)

                    }

                    ScrollView {
                        
                        CurrentWeatherView()
                            .environmentObject(locationManager)
                            .environmentObject(weatherViewModel)
                        
                        
                        VStack(spacing: 40) {
                            
                            
                            
                            HourlyView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            WeatherDetailsView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            
                            DaysForecastView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            WindDetailView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            PrecipitationDetailView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            SunEventsView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            MoonEventsView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            ChancesOfRain(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            
                            PressureChartView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            UVChartView(bgColor: weatherViewModel.currentDayLight ? $bgColor1 : $bgColor)
                                .environmentObject(weatherViewModel)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Following Weather is provided by  Weather ")
                                        .bold()
                                     
                                     
                                     Text("View Here")
                                         .bold()
                                         .onTapGesture {
                                             UIApplication.shared.open(URL(string: "https://weatherkit.apple.com/legal-attribution.html")!)
                                         }
                                         .foregroundStyle(.blue)
                                }
                                
                                Spacer()
                            }
         
                        }
                        .padding()
                        
                        
                    }
                    .scrollIndicators(.hidden)
                    .task(id: locationManager.currentLocation) {
                        do {
                            if let location = locationManager.currentLocation {
                                weatherViewModel.fetchCurrentWeather(userLocation: location)
                            }
                        }
                    }
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation {
                                showSpriteKit = true
                            }
                        }
                        
                        //welcomescreens
                        isOnboarding = false
                        
                        
                        //notificaiton
                        NotificationManager.instance.scheduleNotifications(title: weatherViewModel.currentTemperature, subtitle: weatherViewModel.currentCondition)
                        
                        
                        
                    }
                   
                    
                    
                }.font(.system(size: 13))
                 .foregroundStyle(.white)
                 .tabViewStyle(.page(indexDisplayMode: .never))
            }

    }

}

#Preview {
    mainView()
}
