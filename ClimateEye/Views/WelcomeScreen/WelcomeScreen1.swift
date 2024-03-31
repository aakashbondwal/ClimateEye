//
//  WelcomeScreen1.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//



import SwiftUI

struct WelcomeScreen1: View {

    var body: some View {
            GeometryReader { geometry in

                VStack(alignment: .leading, spacing: 10) {
                    
                    Image("welcome1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400 , height: geometry.size.height / 1.5)
                     
                    
                    
                    Text("Discover the Weather in your City")
                        .font(.title)
                        .bold()
                    
                    Text("Planing your trip becomes more easier with ClimateEye")
                        .font(.headline)
                    
                }.padding()
                    .multilineTextAlignment(.leading)
                    .fontDesign(.rounded)
                    
                
            }
    }
}

#Preview {
    WelcomeScreen1()
}

