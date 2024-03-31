//
//  NotificationsView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI
import UserNotifications


struct NotificationsView: View {

    @Binding var notificationsEnabled : Bool
    
    var body: some View {
        
        VStack {
            Toggle("Notifications", isOn: $notificationsEnabled)
                .padding()
            
            Button(action: {
                if notificationsEnabled {
                    
                    //notification access request
                    
                    NotificationManager.instance.requestAuthorization()
                   
                    
                   
                } else {
                    NotificationManager.instance.cancelNotifications()
                }
            }) {
                Text("Save")
                    .padding()
                   
                 
            }
            
            Spacer()
        }
    }
    private func formatTemperature(_ temperature: Measurement<UnitTemperature>) -> String {
        let celsiusValue = temperature.converted(to: .celsius).value
        let formattedTemperature = String(format: "%.0f", celsiusValue)
        return "\(formattedTemperature)°C"
    }

}
#Preview {
    NotificationsView(notificationsEnabled: .constant(false))
}
