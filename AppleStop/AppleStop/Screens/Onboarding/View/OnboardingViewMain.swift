//
//  OnboardingViewMain.swift
//  AppleStop
//
//  Created by Seik Oh on 2022/04/12.
//

import SwiftUI

struct OnboardingViewMain: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    private let images = ["img_ddakchong", "img_dambi", "img_bandal", "img_doyo"]
    private let infomations = ["멸종위기 동물들과 함께 분리수거해봐요", "바코드 스캔을 통해서 분리수거를 해봐요", "분리수거 가이드를 통해서 분리수거 방법을 알 수 있어요", "분리수거를 하면서 멸종위기 동물들을 알아가봐요"]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.charOrange)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        VStack{
            // 2
            TabView {
                ForEach(Array(0..<4), id: \.self) { index in
                    VStack {
                        Text(infomations[index])
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 34)
                        
                        Image(images[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width, height: 200)
                            .cornerRadius(15)
                    }
                }
            }
            .padding()
            
            Spacer()
                .frame(height: 100)
            
            Button(action: {
                self.viewController?.present(style: .fullScreen, transitionStyle: .coverVertical) {
                    NicknameView()
                }
            }, label: {
                Text("분리수거하러가기")
                    .foregroundColor(Color.charOrange)
                    .font(.title3)
                    .fontWeight(.bold)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.06,  alignment: .center).customShadow())
            })
            
            Spacer()
                .frame(height: 68)
        }
        .tabViewStyle(PageTabViewStyle())
        .overlay(SplashScreenView())
    }
}

struct OnboardingViewMain_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewMain()
    }
}
