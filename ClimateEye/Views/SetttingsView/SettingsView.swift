//
//  SettingsView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("notificationsEnabled") private var notificationsEnabled = false
    var body: some View {
        NavigationStack {
            List {
                
                NavigationLink(destination: NotificationsView(notificationsEnabled: $notificationsEnabled), label: {
                    Text("Notifications")
                })
                
                NavigationLink(destination: ReportView(), label: {
                    Text("Report an Issue")
                })
  
                
               NavigationLink(destination: DocumentationView(), label: {
                   Text("Weather fetch Information ")
               })
                
            }
            
            
            
            
        }
        
        
    }
}

#Preview {
    SettingsView()
}
