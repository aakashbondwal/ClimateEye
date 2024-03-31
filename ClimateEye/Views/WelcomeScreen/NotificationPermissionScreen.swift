//
//  NotificationPermissionScreen.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//



import SwiftUI
import WeatherKit

struct NotificationPermissionScreen: View {
    let weatherService = WeatherService.shared
    @State private var bgColor: Color = Color(#colorLiteral(red: 0.1237571016, green: 0.1237571016, blue: 0.1237571016, alpha: 1))
    @State private var weather: Weather?
    @StateObject private var locationManager = LocationManager()
    
    var content = """
Stay weather-ready with Climate Eye. Enable notifications to receive essential updates, including severe weather alerts, daily forecasts, and sunrise/sunset reminders.
"""
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Image("welcome3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: geometry.size.height / 1.6)
         
                    
                    
                    Text("Notification Access")
                        .font(.title)
                        .bold()
                    
                    Text(content)
                        .font(.headline)
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            mainView()
                        } label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 30)
                                .foregroundStyle(.purple)
                        
                        }
                    }

                    
                }.padding()
                    .multilineTextAlignment(.leading)
                    .fontDesign(.rounded)
                    .task(id: locationManager.currentLocation) {
                        do {
                            if let location = locationManager.currentLocation {
                                self.weather = try await weatherService.weather(for: location)

                            }
                        } catch {
                            print(error)
                        }
                        

                    }
  
            }
            
        }
    }
}

#Preview {
    NotificationPermissionScreen()
}

