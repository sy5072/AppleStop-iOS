//
//  OnboardingViewOne.swift
//  AppleStop
//
//  Created by Seik Oh on 2022/04/07.
//
import SwiftUI
import SDWebImageSwiftUI

struct OnboardingViewOne: View {
    var body: some View {
        //NavigationView{
            VStack{
                Text("멸종위기 동물과 함께 분리수거해봐요")
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)
                
                WebImage(url: URL(string: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/dog-face_1f436.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity, height: .infinity)
                    .cornerRadius(15)
                
                
                NavigationLink(destination: OnboardingViewTwo()) {
                    Text("설정하기")
                        .font(.title3)
                        .fontWeight(.bold)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white)
                            .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.06,  alignment: .center))
                        .foregroundColor(Color.charOrange)
                        .customShadow()
                }
                .padding(.top, 20)
            }
            .padding()
        //}
        //using overlay instead of ZStack due to issues with animations
        //.overlay(SplashScreenView())
    }
}

struct OnboardingViewOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewOne()
    }
}
