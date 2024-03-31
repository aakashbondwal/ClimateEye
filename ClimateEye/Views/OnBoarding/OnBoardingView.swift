//
//  OnBoardingView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 31/10/23.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        TabView {
            WelcomeScreen1()
            
            LocationPermissionScreen()
            
            NotificationPermissionScreen()
            
        }.ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnBoardingView()
}
