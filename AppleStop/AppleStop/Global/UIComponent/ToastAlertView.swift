//
//  ToastAlertView.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/12.
//

import SwiftUI


struct ToastModifier : ViewModifier {
    
    @Binding var isShowing : Bool
    let duration : TimeInterval
    
    func body(content: Content) -> some View {
        ZStack{
            content
            if isShowing {
                VStack {
                   
                    HStack{
                        Image(systemName: "heart.fill")
                        Text("Photo saved successfully!")
                            .font(.footnote)
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                }
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
           
        }
    }
}

struct ToastAlertView: View {
    var body: some View {
        Text("hello")
        
    }
}


extension View {
    func toast(isShowing: Binding<Bool>, duration: TimeInterval=1) -> some View {
        modifier(ToastModifier(isShowing: isShowing, duration: duration))
    }
}
 


//struct ToastAlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToastAlertView()
//    }
//}
