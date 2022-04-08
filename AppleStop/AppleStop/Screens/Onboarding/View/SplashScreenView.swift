//
//  SplashScreen.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreenView: View {
    //Animation Properties
    @State var isAnimating = false
    @State var startAnimation = false
    @State var isFinished = false
    
    var body: some View {
        if !isFinished{
            ZStack{
                Color.green //Background color
                    .ignoresSafeArea()
                
                VStack{
                    Image("logo_barcode")
                        .resizable()
                        .frame(width: 260, height: 260)
                        .aspectRatio(contentMode: .fit)
                        .opacity(startAnimation ? 1: 0)
                    
                    Text("수거딱대\nC'mere Recycle\n")
                        .font(.title3)
                        .fontWeight(.bold)
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
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    withAnimation(.linear(duration: 2)){
                        startAnimation.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
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
        OnboardingView()
    }
}
