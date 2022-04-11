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
    
    @State var name: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    VStack{
                        HStack{
                            Text("수거딱대에서 사용할 닉네임을 입력해주세요.")
                                .foregroundColor(Color.gray)
                            Spacer()
                            
                        }
                        .padding()
                        
                        //Textfield
                        ZStack{
                            TextField("  Enter your nickname", text: $name)
                                .multilineTextAlignment(.center)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius:2)
                                    .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.05,  alignment: .center)
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                                    .shadow(color: Color.white.opacity(0.3), radius: 10, x: -5, y: -5))
                            /*
                             Text("\(name)")
                             .font(.title3)
                             .fontWeight(.bold)
                             .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius:2)
                             .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.05,  alignment: .center)
                             .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                             .shadow(color: Color.white.opacity(0.3), radius: 10, x: -5, y: -5))
                             .foregroundColor(Color.gray)
                             */
                        }
                    }
                    
                    
                    //TODO: 글자를 입력할 수 있도록 처리
                    //TODO: 글자수 제한은 8문자로 제한
                    
                    //TODO: 숫자가 글자수에 따라 dynamic하게 바뀌도록 처리
                    HStack{
                        Spacer()
                        Text("0/8")
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 1.0)
                    }
                    .padding(.trailing)
                    
                    //설정하기 버튼
                    //TODO: NavigationLink destination 수정
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
            .navigationTitle("닉네임 설정")
        }
    }
}

struct Nickname_Previews: PreviewProvider {
    static var previews: some View {
        Nickname()
    }
}
