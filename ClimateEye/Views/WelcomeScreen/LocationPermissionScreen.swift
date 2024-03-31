//
//  LocationPermissionScreen.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.


import SwiftUI

struct LocationPermissionScreen: View {

    let colors = [Color(#colorLiteral(red: 0.3445351422, green: 0.1541474164, blue: 0.3958391249, alpha: 1)), Color(#colorLiteral(red: 0.480399847, green: 0.2106532753, blue: 0.3578186333, alpha: 1))]  
    var body: some View {

        ZStack {
            
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Image("welcome2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: geometry.size.height / 1.5)
               
                    
                    
                    Text("Location Services")
                        .font(.title)
                        .bold()
                    
                    Text("Enhance your Climate Eye experience by enabling location services. We'll provide you with precise local weather forecasts, tailored travel information, and timely alerts for your area.")
                        .font(.headline)
                    
                }.padding()
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .fontDesign(.rounded)
                
                
            }
        }

    }
}

#Preview {
    LocationPermissionScreen()
}
