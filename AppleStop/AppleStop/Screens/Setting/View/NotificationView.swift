//
//  ContentView.swift
//  WasteTimeRecord
//
//  Created by DaeSeong on 2022/04/01.
//

import SwiftUI

struct NotificationView: View {
    
    @State var showAlert = false
    
    
    var body: some View {
        VStack {
            Text("Notification Demo")
            Button {
                setNotification()
            } label: {
                Text("SetNotification!")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("경고"), message: Text("알림을 허용해주세요"), dismissButton: .default(Text("확인")))

            }
        }
    }
}

func setNotification() -> Void {
    let manager = NotificationManager()
    manager.requestPermission()
    manager.addNotification(title: "수거딱대")
    manager.schedule()
}

func delNotification() -> Void {
    let manager = NotificationManager()
    manager.addNotification(title: "수거딱대")
    manager.scheduleNotifications(isOn: false)
    
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
        }
    }
}
