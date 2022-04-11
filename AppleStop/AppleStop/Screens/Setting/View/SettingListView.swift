//
//  SettingListView.swift
//  AppleStop
//
//  Created by Seungyun Kim on 2022/04/11.
//

import SwiftUI

struct SettingListView: View {
    
    let title : String
    let navIndex : Int
    @State var hasAlarm : Bool
    @State var isAlarm: Bool
    
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
                    NavigationLink(destination: OnboardingViewTwo() ){
                        HStack{
                            Text("\(title)")
                            Spacer()
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 10)
                } else if navIndex == 3 {
                    NavigationLink(destination: FeedbackView() ){
                        HStack{
                            Text("\(title)")
                            Spacer()
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 10)
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
}

struct SettingListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingListView(title: "hiiiii", navIndex: 1, hasAlarm: false, isAlarm: true)
    }
}
