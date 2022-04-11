//
//  TabbarView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct TabbarView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader{ geometry in
            
            ZStack {
                VStack{
                    Spacer()
                    switch viewRouter.currentPage {
                    case .home:
                        HomeView()
                    case .camera:
                        CameraView()
                    case .guide:
                        GuideView()
                    }
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: geometry.size.width, height: geometry.size.height/9)
                            .background(.white)
                            .customShadow()
                        HStack{
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "house", tabName: "홈", isCamera: false)
                            
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .camera, width: geometry.size.width/4, height: geometry.size.height/4, systemIconName: "", tabName: "", isCamera: true)
                                .customShadow()
                                
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .guide, width: geometry.size.width/6, height: geometry.size.height/30, systemIconName: "book", tabName: "분리수거 가이드", isCamera: false)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/9)
                        .background(.white)
                    }
                    
                  
                    
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
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
        .onTapGesture {
            viewRouter.currentPage = assignedPage 
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .charOrange : .gray)
    }
}
 
