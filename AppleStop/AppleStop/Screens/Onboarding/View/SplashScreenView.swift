//
//  SplashScreen.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreenView: View {
    
    @State var angle: Double = 0.0
    @State var isAnimating = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 8.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        
        ZStack{
            Color.green //Background color
                .ignoresSafeArea()
            VStack{
                //  WebImage(url: URL(string: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/dog-face_1f436.png"))
                Image("logo_barcode")
                    .resizable()
                    .frame(width: 260, height: 260)
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                    .animation(self.foreverAnimation, value: isAnimating)
                    .onAppear {
                        self.isAnimating = true
                    }
                Text("수거딱대\nC'mere Recycle")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .colorInvert()
            }
            VStack{
                Spacer()
                Text("V 1.0.0")
                    .fontWeight(.bold)
                    .colorInvert()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
