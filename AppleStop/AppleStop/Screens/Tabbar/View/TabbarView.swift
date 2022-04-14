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
                            .customShadow()
                        HStack{
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "house", tabName: "홈", isCamera: false, isCameraPressed: false)
                            
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .camera, width: geometry.size.width/4, height: geometry.size.height/4, systemIconName: "", tabName: "", isCamera: true,isCameraPressed: false)
                                .customShadow()
                                
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .guide, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "book", tabName: "분리수거 가이드", isCamera: false,isCameraPressed: false)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
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
    @State var isCameraPressed = false
    var body: some View {
        VStack{
            if isCamera {
                Image("logo_barcode")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.horizontal, 20)
                    .offset(y: -height/5)
            } else {
                Image(systemName: systemIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
//                    .padding(.top, 10)
                Text(tabName)
                    .font(.system(size: 10))
         
            }
        }
        .padding(.bottom, 10)
        .onTapGesture {
            
            if assignedPage == .camera {
                isCameraPressed = true

            } else {
            viewRouter.currentPage = assignedPage
            }
        }
        .fullScreenCover(isPresented: $isCameraPressed, content: {
            NavigationView{
                CameraView()
         }
        })
        .foregroundColor(viewRouter.currentPage == assignedPage ? .charOrange : .gray)
    }
}
 
