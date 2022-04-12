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
    
    @AppStorage("hideTabbar") var hideTabbar : Bool = false
    @State private var isPresenting = false
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .guide:
                    GuideView()
                }
                Spacer()
                
                if hideTabbar {
                    EmptyView()
                } else {
                    tabbarView
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        
        // TODO: - 카메라뷰를 탭바에 연결 시에 fullScreenCover 필요
        //                .fullScreenCover(isPresented: $isPresenting) {
        //                    NavigationView{
        //                    }
        //                    CameraView()
        //                }
    }
    
    var tabbarView: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/9)
                .background(.white)
                .customShadow()
            HStack{
                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: UIScreen.main.bounds.size.width/5, height: UIScreen.main.bounds.size.height/30, systemIconName: "house", tabName: "홈", isCamera: false)
                
                TabBarIcon(viewRouter: viewRouter, assignedPage: nil, width: UIScreen.main.bounds.size.width/4, height: UIScreen.main.bounds.size.height/4, systemIconName: "", tabName: "", isCamera: true).shadow(radius: 2)
                    .customShadow()
                
                TabBarIcon(viewRouter: viewRouter, assignedPage: .guide, width: UIScreen.main.bounds.size.width/5, height: UIScreen.main.bounds.size.height/30, systemIconName: "book", tabName: "분리수거 가이드", isCamera: false)
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/8)
            .background(.white)
        }
    }
    
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page?
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
            if let assignedPage = assignedPage {
                viewRouter.currentPage = assignedPage
            }
            
            if isCamera {
                self.viewController?.present(style: .fullScreen, transitionStyle: .coverVertical) {
                    CameraView()
                }
            }
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .charOrange : .gray)
    }
}
