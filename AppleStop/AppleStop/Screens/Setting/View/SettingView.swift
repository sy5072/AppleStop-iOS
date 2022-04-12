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
        ZStack{
            Color.listGrey
                .ignoresSafeArea()
            
            VStack{
                
                
                NavigationView {
                    List{
                        SettingListView(title: "알림 설정", navIndex: 1, hasAlarm: true, isAlarm: isNotificated)
                        SettingListView(title: "닉네임 변경", navIndex: 2, hasAlarm: false, isAlarm: false)
                        SettingListView(title: "피드백 보내기", navIndex: 3, hasAlarm: false, isAlarm: false)
                        SettingListView(title: "개인정보 처리방침", navIndex: 4, hasAlarm: false, isAlarm: false)
                        SettingListView(title: "서비스 이용약관", navIndex: 5, hasAlarm: false, isAlarm: false)
                        SettingListView(title: "수거딱대 가이드라인", navIndex: 6,hasAlarm: false, isAlarm: false)
//                        Spacer()
//                            .listRowBackground(Color.clear)
//                            .listRowSeparator(.hidden)
                        ZStack {
                            
                            Rectangle()
                                .fill(Color.listGrey)
                                .frame(height:780)
                            
                            VStack{
                                Text("Made by 애플스탑")
                                Text("v 1.0.0")
                            }
                            .font(.system(size: 12, weight: .light))
                        }
          
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
          
                    
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                }
                
                              
                
               
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
