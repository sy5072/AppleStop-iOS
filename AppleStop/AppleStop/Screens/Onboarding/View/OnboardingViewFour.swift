//
//  OnboardingViewFour.swift
//  AppleStop
//
//  Created by Seik Oh on 2022/04/07.
//
import SwiftUI
import SDWebImageSwiftUI

struct OnboardingViewFour: View {
    var body: some View {
        //NavigationView{
                VStack{
                    Text("분리수거 가이드라인으로\n상세한 정보 득템!")
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                    
                    WebImage(url: URL(string: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/325/cat-face_1f431.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity, height: .infinity)
                        .cornerRadius(15)
                    
                     NavigationLink(destination: NicknameView()) {
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


struct OnboardingViewFour_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewFour()
    }
}
