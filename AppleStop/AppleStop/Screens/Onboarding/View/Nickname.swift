//
//  Nickname.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//
import SwiftUI
import SDWebImageSwiftUI

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct Nickname: View {
    var body: some View {
        ZStack{
            VStack{
                Text("닉네임 설정")
                    .font(.title.bold())
                    .multilineTextAlignment(.leading)
            }
            VStack{
                //설정하기 버튼
                Spacer()
                NavigationLink(destination: OnboardingViewTwo()) {
                    Text("설정하기")
                        .font(.title3)
                        .fontWeight(.bold)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius:2)
                            .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.06,  alignment: .center)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.3), radius: 10, x: -5, y: -5))
                        .foregroundColor(Color.orange)
                    
                    
                }
            }
            .padding()
        }
    }
}

struct Nickname_Previews: PreviewProvider {
    static var previews: some View {
        Nickname()
    }
}
