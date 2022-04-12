//
//  TabbarView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import CoreMedia

struct TabbarView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    
    @State private var isPresenting = false

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
                            .shadow(radius: 2)
                        HStack{
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "house", tabName: "홈", isCamera: false)
    //                            .shadow(radius: 0)
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .camera, width: geometry.size.width/4, height: geometry.size.height/4, systemIconName: "", tabName: "", isCamera: true).shadow(radius: 2)
                                
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .guide, width: geometry.size.width/6, height: geometry.size.height/30, systemIconName: "book", tabName: "분리수거 가이드", isCamera: false)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/9)
                        .background(.white)
                    }
                    
                  
                    
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }

        // TODO: - 카메라뷰를 탭바에 연결 시에 fullScreenCover 필요
//                .fullScreenCover(isPresented: $isPresenting) {
//                    NavigationView{
//                    }
//                    CameraView()
//                }
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
        .foregroundColor(viewRouter.currentPage == assignedPage ? .orange : .gray)
    }
}
 
