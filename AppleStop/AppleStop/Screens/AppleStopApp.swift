//
//  AppleStopApp.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import AVFoundation

@main
struct AppleStopApp: App {
    
    // MARK: - properties
    
    @AppStorage("nickname") var nickname : String = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 14, weight: .light)]
        
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().layer.masksToBounds = false
        UINavigationBar.appearance().layer.shadowColor = UIColor.lightGray.cgColor
        UINavigationBar.appearance().layer.shadowOpacity = 0.8
        UINavigationBar.appearance().layer.shadowOffset = CGSize(width: 0, height: 2.0)
        UINavigationBar.appearance().layer.shadowRadius = 2
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
 
        
       
       
    }
    
    var body: some Scene {
        WindowGroup {
            if nickname == "" {
                OnboardingViewMain()
            } else {
                TabbarView(viewRouter: ViewRouter())
            }
        }
    }
}
