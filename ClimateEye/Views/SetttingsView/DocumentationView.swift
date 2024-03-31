//
//  DocumentationView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import SwiftUI

struct DocumentationView: View {
    var body: some View {
        ScrollView {

            VStack(alignment: .leading, spacing: 10) {
                
                
                Text("Powered by  Weather")
                    .font(.largeTitle)
                    .bold()
                
                Text("WeatherKit is powered by the all-new Apple Weather service, a state-of-the-art global weather forecast that provides all of the data you need to power your app with timely, hyperlocal weather information. This enables your app to offer current weather conditions and 10-day hourly forecasts for temperature, precipitation, wind, UV Index, and more. Minute-by-minute precipitation for the next hour and severe weather alerts are available for select regions.")
                
                Text("Easy to use")
                    .font(.largeTitle)
                    .bold()
                
                Text("WeatherKit includes a Swift API that leverages modern Swift syntax. And with Swift concurrency, it’s easy to request weather data with just a few lines of code. WeatherKit is also customizable, so you can request just the data you need. And because WeatherKit is built on time-tested Foundation and CoreLocation APIs, it’s simple to format measurements, convert units, and get location information.")
                
                Text("Privacy First")
                    .font(.largeTitle)
                    .bold()
                
                Text("In keeping with Apple’s commitment to privacy, WeatherKit is designed to give hyperlocal forecasts without compromising user data. Location information is used only to provide weather forecasts, is not associated with any personally identifiable information, and is never tracked between requests.")
                
                
                
                Text("View Here")
                    .bold()
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://weatherkit.apple.com/legal-attribution.html")!)
                    }
                    .foregroundStyle(.blue)
                
      
                
            }.padding(.horizontal)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    DocumentationView()
}
