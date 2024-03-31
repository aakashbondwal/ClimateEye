//
//  ReportView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//

import SwiftUI

struct ReportView: View {

    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 15){
                
                Text("At ClimateEye, we believe that your feedback is invaluable in helping us improve our services and provide you with the best possible weather app experience. We've recently received some feedback from users who expressed their dissatisfaction with certain aspects of our app, and we want to take a moment to address these concerns.")
                
                
                Text("User Feedbacks Matters")
                    .font(.title)
                    .bold()
                
                Text("We genuinely appreciate the users who have taken the time to provide feedback, whether it's about the user interface, specific features, or any other aspect of our app. Your feedback helps us understand your needs better and work towards making improvements.")
                
                Text("Dealing with Dissatisfaction")
                    .font(.title)
                    .bold()
                
                Text("We understand that not every user will be completely satisfied with our app, as preferences and expectations can vary. If you've encountered something in our app that you don't like or if you're experiencing any issues, please know that we take your concerns seriously, and we're committed to addressing them.")
                
                Text("How you can help")
                    .font(.title)
                    .bold()
                
                Text("We encourage users to continue providing feedback. Your insights and suggestions are what drive our app's evolution. If there's something specific you'd like to see improved, added, or changed, please let us know through our feedback channels. We're committed to listening and acting on your input.")
                
                
                Text("Our Commitment")
                    .font(.title)
                    .bold()
                
                Text("""
                     At ClimateEye, we are dedicated to providing a top-notch weather app experience. We understand that not everyone will be fully satisfied at all times, but we're here to work on making your experience better. Your feedback is the catalyst for the positive changes we aim to bring.
                     
                     We appreciate your patience and understanding as we work to address any concerns. Our mission is to deliver a weather app that truly serves your needs, and we're committed to getting there with your help.

                     Thank you for choosing ClimateEye, and thank you for helping us make it even better. ❤️
                     """)
                
                
            }.padding(.horizontal)
                .multilineTextAlignment(.leading)
                .fontDesign(.rounded)
            
            
        }
    }
}

#Preview {
    ReportView()
}
