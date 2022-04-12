//
//  SettingListView.swift
//  AppleStop
//
//  Created by Seungyun Kim on 2022/04/11.
//

import SwiftUI
import UIKit
import MessageUI

struct SettingListView: View {
    
    let title : String
    let navIndex : Int
    @State var hasAlarm : Bool
    @State var isAlarm: Bool
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State private var showSheet = false
    @State private var mailData = ComposeMailData(subject: "수거딱대 문의사항",
                                                  recipients: ["sy5072@naver.com"],
                                                  message: "",
                                                  attachment: [])
   @State private var showMailView = false
    
    
    var body: some View {

        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: 320, height: 45)
                .cornerRadius(10)
                .customShadow()
            
            if hasAlarm {
                HStack{
                    Text("알림 설정")
                    Spacer()
                    Toggle("notification", isOn: $isAlarm)
                        .labelsHidden()
                        .frame(height: 20)
                }
                .padding(12)
                .padding(.horizontal, 10)
              
            } else {
                if navIndex==2 {
                    NavigationLink(destination: NicknameView() ){
                        HStack{
                            Text("\(title)")
                            Spacer()
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 10)
                } else if navIndex == 3 {
                    HStack {
                        Button(action: {
                            showMailView.toggle()
                        }) {
                            Text("\(title)")
                        }
                        .disabled(!MailView.canSendMail)
                        .sheet(isPresented: $showMailView) {
                            MailView(data: $mailData) { result in
                                print(result)
                                }
                           }
                        .foregroundColor(.black)
                        .padding(12)
                        
                        Spacer()
                            
                    }
                    .frame(width: 310, height: 45)
                    .padding(.horizontal, 8)
                  
                } else if navIndex == 4 {
                    NavigationLink(destination: PrivacyPolicyView() ){
                        HStack{
                            Text("\(title)")
                            Spacer()
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 10)
                } else if navIndex == 5 {
                    NavigationLink(destination: ServiceTermView() ){
                        HStack{
                            Text("\(title)")
                            Spacer()
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 10)
                } else if navIndex == 6 {
                    NavigationLink(destination: OnboardingViewOne() ){
                        HStack{
                            Text("\(title)")
                            Spacer()
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
    
    func suggestFeature() {
        if MFMailComposeViewController.canSendMail() {
            self.showSheet = true
        } else {
            print("Error sending mail")
        }
    }
}



struct SettingListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingListView(title: "피드백 보내기", navIndex: 4, hasAlarm: false, isAlarm: true)
    }
}
