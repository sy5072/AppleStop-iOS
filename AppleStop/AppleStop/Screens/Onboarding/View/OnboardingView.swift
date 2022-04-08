//
//  OnboardingView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 20){
                    WebImage(url: URL(string: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/dog-face_1f436.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        //.frame(height:300)
                        .cornerRadius(15)
                    
                    Text("Testing with Dog")
                        .font(.title.bold())
                }
                .padding()
            }
            .navigationTitle("Latest")
        }
        
        
        
        //using overlay instead of ZStack due to issues with animations
        //.overlay(SplashScreenView())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
