//
//  SettingView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct SettingView: View {
    
    @State var isNotificated = true
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Image(systemName: "multiply")
                        .padding()
                    
                    Spacer()
                }
                
                Text("설정")
                    .font(.system(size: 16))
               
            }
            
            NavigationView {
                List{
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 320, height: 45)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        
                        HStack{
                            Text("알림 설정")
                            Spacer()
                            Toggle("notification", isOn: $isNotificated)
                                .labelsHidden()
                                .frame(height: 20)
                        }
                        .padding(12)
                        .padding(.horizontal, 10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 320, height: 45)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        
                        NavigationLink(destination: OnboardingViewOne()){
                            HStack{
                                Text("닉네임 변경")
                                Spacer()
                            }
                            .padding(12)
                        }
                        .padding(.horizontal, 10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 320, height: 45)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        
                        NavigationLink(destination: OnboardingViewOne()){
                            HStack{
                                Text("피드백 보내기")
                                Spacer()
                            }
                            .padding(12)
                        }
                        .padding(.horizontal, 10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 320, height: 45)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        
                        NavigationLink(destination: OnboardingViewOne()){
                            HStack{
                                Text("개인정보 처리방침")
                                Spacer()
                            }
                            .padding(12)
                        }
                        .padding(.horizontal, 10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 320, height: 45)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        
                        NavigationLink(destination: OnboardingViewOne()){
                            HStack{
                                Text("서비스 이용약관")
                                Spacer()
                            }
                            .padding(12)
                        }
                        .padding(.horizontal, 10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 320, height: 45)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        
                        NavigationLink(destination: OnboardingViewOne()){
                            HStack{
                                Text("수거딱대 가이드라인")
                                Spacer()
                            }
                            .padding(12)
                        }
                        .padding(.horizontal, 10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
//                    ForEach (settings) { setting in
//                        cardView(setting: setting)
//                    }
//                    .listRowBackground(.clear)
                
                }
                .navigationBarTitle("")
                        .navigationBarHidden(true)
                
                
                
            }
//            aspectRatio(contentMode: <#T##ContentMode#>)
//            .frame(width:400)
        
            
            VStack{
                Text("Made by 애플스탑")
                Text("v 1.0.0")
            }
            .font(.system(size: 12, weight: .light))
        }
    }
}

struct cardView: View {
    
    var setting: Setting
    
    var body : some View {
//        NavigationLink(destination:setting.nav){
            HStack{
                Text(setting.title)
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .frame(width: 310, alignment: .leading)
//        }
       
        
    }
    
}

struct Setting: Identifiable {
    let id = UUID()
    let title : String
    let nav : String
}

var settings = [
    Setting(title: "닉네임 변경", nav: "NicknameView"),
    Setting(title: "피드백 보내기", nav: "FeedbackView"),
    Setting(title: "개인정보 처리방침", nav: "RuleView"),
    Setting(title: "서비스 이용약관", nav: "ServiceInfoView"),
    Setting(title: "수거딱대 가이드라인", nav: "GuideView")
]

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
