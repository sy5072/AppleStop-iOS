//
//  OnboardingViewMain.swift
//  AppleStop
//
//  Created by Seik Oh on 2022/04/12.
//

import SwiftUI

struct OnboardingViewMain: View {
    private let images = ["logo_barcode", "logo_barcode", "logo_barcode", "logo_barcode"]
    
    var body: some View {
        NavigationView{
        VStack{
            Text("멸종위기 동물과 함께 분리수거해봐요")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            // 2
            TabView {
                ForEach(images, id: \.self) { item in
                    //3
                    VStack{
                        
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //.frame(width: .infinity, height: .infinity)
                            .cornerRadius(15)
                    }
                    .padding(.top, 20)
                    
                }
                .padding()
            }
            NavigationLink(destination: NicknameView()) {
                Text("설정하기")
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

struct OnboardingViewMain_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewMain()
    }
}
