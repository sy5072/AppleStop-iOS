//
//  OnboardingViewMain.swift
//  AppleStop
//
//  Created by Seik Oh on 2022/04/12.
//

import SwiftUI

struct OnboardingViewMain: View {
    private let images = ["img_ddakchong", "img_dambi", "img_bandal", "img_doyo"]
    
    @State var backgroundoffset: CGFloat = 0
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Spacer()
                    Text("멸종위기 동물들과 함께 분리수거해봐요")
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                    // 2
                    TabView {
                        ForEach(images, id: \.self) { item in
                            //3
                            Image(item)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .cornerRadius(15)
                                //.padding(.top, 20)
                        }
                    }
                    NavigationLink(destination: NicknameView()) {
                        Text("분리수거하러가기")
                            .foregroundColor(Color.charOrange)
                            .font(.title3)
                            .fontWeight(.bold)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.06,  alignment: .center).customShadow())
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
            .overlay(SplashScreenView())
        }
    }
}

struct OnboardingViewMain_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewMain()
    }
}
