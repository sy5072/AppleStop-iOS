//
//  SplashScreen.swift
//  AppleStop
//
//  Created by Seik Oh on 2022/04/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreenView: View {
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var count: Float = 2.0
    @State var finishedText: String? = nil //optional string
    
    //Animation Properties
    @State var isAnimating = false
    @State var startAnimation = false
    @State var isFinished = false
    
    var body: some View {
        if !isFinished{
            ZStack{
                Color.mainGreen
                    .ignoresSafeArea()
                
                VStack{
                    Text("수거딱대\nC'mere Recycle")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .colorInvert()
                        .opacity(startAnimation ? 1: 0)
                    
                    Image("logo_barcode")
                        .resizable()
                        .frame(width: 260, height: 260)
                        .aspectRatio(contentMode: .fit)
                        .opacity(startAnimation ? 1: 0)
                        .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                        .animation(.linear(duration: 2.5), value: isAnimating)
                        .onAppear {
                            self.isAnimating = true
                        }
                    
                    Text(finishedText ?? "Let's") //if no finished string, insert count
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .colorInvert()
                        .opacity(startAnimation ? 1: 0)
                }
                VStack{
                    Spacer()
                    Text("V 1.0.0")
                        .fontWeight(.bold)
                        .colorInvert()
                }
                //Text Movement Accoding to Time
                .onReceive(timer, perform: {_ in
                    if count == 2.0{
                        finishedText = "Let's"
                        count -= 1
                    }
                    else if count == 1.0 {
                        finishedText = "Let's Recycle"
                        count -= 1
                    }
                    else {
                        finishedText = "Let's Recycle Properly!"
                        count -= 1
                    }
                })
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    withAnimation(.spring()){  //.linear(duration: 2)
                        startAnimation.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                    withAnimation{
                        isFinished.toggle()
                    }
                }
            }
        }
    }
}


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        //SplashScreenView()
        //OnboardingViewOne()
        OnboardingViewMain()
    }
}
