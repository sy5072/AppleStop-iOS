//
//  OnboardingView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//
import SwiftUI
import SDWebImageSwiftUI

struct OnboardingViewTwo: View {
    var body: some View {
        //NavigationView{
            //ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text("바코드 스캔은\n다음과 같이!")
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                    
                    WebImage(url: URL(string: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/fox_1f98a.png"))
                        .resizable()
                        //.aspectRatio(contentMode: .fill)
                        .frame(height:500)
                        //.cornerRadius(15)
                    
                    
                    Spacer()
                    NavigationLink(destination: OnboardingViewThree()) {
                        Text("Next")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                }
                .padding()
            //}
        //}
        //using overlay instead of ZStack due to issues with animations
        //.overlay(SplashScreenView())
    }
}

struct OnboardingViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewTwo()
    }
}
