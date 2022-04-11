//
//  TabbarView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                Text("Home")
                Spacer()
                HStack{
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "house", tabName: "홈", isCamera: false)
                        .shadow(radius: 0)
                    TabBarIcon(width: geometry.size.width/4, height: geometry.size.height/4, systemIconName: "", tabName: "", isCamera: true)
                        
                    TabBarIcon(width: geometry.size.width/6, height: geometry.size.height/30, systemIconName: "book", tabName: "분리수거 가이드", isCamera: false)
                        .shadow(radius: 0)
                }
                .frame(width: geometry.size.width, height: geometry.size.height/9)
                .background(.white)
                .shadow(radius: 2)
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

struct TabBarIcon: View {
    
    let width, height : CGFloat
    let systemIconName, tabName : String
    let isCamera : Bool
    
    var body: some View {
        VStack{
            if isCamera {
                Image("logo_barcode")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.horizontal, 20)
                    .offset(y: -height/6)
            } else {
                Image(systemName: systemIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.top, 10)
                Text(tabName)
                    .font(.footnote)
        
            }
            
        }
    }
}
