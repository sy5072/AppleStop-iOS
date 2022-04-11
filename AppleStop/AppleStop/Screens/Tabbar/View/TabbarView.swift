//
//  TabbarView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            
            CameraView()
                .tabItem {
                        Image(systemName: "camera")

                }
            
            GuideView()
                .tabItem {
                    Image(systemName: "book")
                    Text("분리수거 가이드")
                }
        }
        
        
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
