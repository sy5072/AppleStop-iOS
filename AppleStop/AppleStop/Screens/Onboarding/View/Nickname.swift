//
//  Nickname.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//
import SwiftUI
import Combine

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct Nickname: View {
    @State var name: String = ""
    
    let textLimit = 8
    
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
                            VStack{
                                TextField("  Enter your nickname", text: $name)
                                    .onReceive(Just(name)) { _ in limitText(textLimit) }
                                    .multilineTextAlignment(.center)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius:2)
                                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.05,  alignment: .center)
                                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: -5, y: -5))
                                
                                //TextField 값의 텍스트 출력 시험
                                    .padding()
                                Text("test: \(name)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius:2)
                                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.05,  alignment: .center)
                                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: -5, y: -5))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    
                    //글자수 나타내기
                    HStack{
                        Spacer()
                        Text("\(name.count)/8")
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
    
    //8글자로 제한
    func limitText(_ upper: Int) {
        if name.count > upper {
            name = String(name.prefix(upper))
        }
    }
}

struct Nickname_Previews: PreviewProvider {
    static var previews: some View {
        Nickname()
    }
}
