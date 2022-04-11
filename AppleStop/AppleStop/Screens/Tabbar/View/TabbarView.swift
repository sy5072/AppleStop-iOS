//
//  TabbarView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import CoreMedia

struct TabbarView: View {
    
    @State private var isPresenting = false

    var body: some View {
        
        ZStack {
            
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

            }
            
 

            
        }.background(.gray)
    }

}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
