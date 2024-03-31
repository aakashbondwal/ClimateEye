//
//  mainTabView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 30/10/23.
//

import SwiftUI

struct mainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {

            mainView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(1)
            
            
        }.tint(.purple)


    }
}

#Preview {
    mainTabView()
}
