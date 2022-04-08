//
//  SplashScreen.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreenView: View {
    
    //start this timer as soon as we initialize this view
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    //Current time
    /*
    @State var currentDate: Date = Date() // current exact date of right now
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
*/
    @State var count: Int = 3
    @State var finishedText: String? = nil //optional string
    //Countdown
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
                Text("수거딱대\nC'mere Recycle\n")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .colorInvert()
                /*
                Text(dateFormatter.string(from: currentDate))
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .colorInvert()
                */
                Text(finishedText ?? "\(count)") //if no finished string, insert count
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
        .onReceive(timer, perform: {_ in
            if count < 1{
                finishedText = "Now going to onboarding view!"
            } else{
                count -= 1
            }
        })
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
