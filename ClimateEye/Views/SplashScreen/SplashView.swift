//
//  SplashView.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import SwiftUI
import UserNotifications

struct SplashView: View {
    
    @State var isActive: Bool = false
    @State var endSplash = false
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        ZStack {
            
            if isOnboarding {
                OnBoardingView()
            } else  {
                mainTabView()
                    
            }
            
            ZStack {
                
                Color.white
                    .ignoresSafeArea()
                
                Image("flashscreen")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: isActive ? .fill : .fit)
                    .frame(width: isActive ? nil : 200, height: isActive ? nil : 200)
                    .scaleEffect(isActive ? 3 : 1)
                
              
                    .frame(width: UIScreen.main.bounds.width)
             
                
            }.ignoresSafeArea(.all, edges: .all)
                .onAppear(perform: animateSplash)
                .opacity(endSplash ? 0 : 1)
                .onAppear {
                    
                    //notifications off
               
                    UNUserNotificationCenter.current().setBadgeCount(0)
                  
                    
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    
                    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                    
                    
                }
            
            
        }
    }
    
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            
            withAnimation(Animation.easeOut(duration: 0.45)){
                isActive.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.35)){
                endSplash.toggle()
            }
        }
    }
    
}

#Preview {
    SplashView()
}
