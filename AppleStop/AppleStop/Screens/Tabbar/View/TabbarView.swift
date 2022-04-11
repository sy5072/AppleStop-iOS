//
//  TabbarView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var isPresenting = false
    var body: some View {
        
        ZStack {
            
            GeometryReader{ geometryProxy -> AnyView in

                let height = geometryProxy.frame(in: .global)
                return AnyView(
                
                    ZStack{
                        BlurView(style: .systemMaterialDark)
                    }
                )
            }
            VStack{
            
                Button {
                    isPresenting.toggle()
                } label: {
                    Image("logo_camera")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .fullScreenCover(isPresented: $isPresenting) {
                    NavigationView{
                    CameraView()
                    }
                }

                
                
    //        NavigationLink {
    //            CameraView()
    //        } label: {
    //            Image("logo_camera")
    //                .resizable()
    //                .frame(width: 100, height: 100)
    //        }

            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
