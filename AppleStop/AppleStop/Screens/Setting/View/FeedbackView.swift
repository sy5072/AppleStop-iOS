//
//  FeedbackView.swift
//  AppleStop
//
//  Created by Seungyun Kim on 2022/04/11.
//

import Foundation
import SwiftUI
import UIKit
import MessageUI

struct FeedbackView: View {
  @State private var mailData = ComposeMailData(subject: "수거딱대 문의사항",
                                                recipients: ["sy5072@naver.com"],
                                                message: "",
                                                attachment: [])
 @State private var showMailView = false

  var body: some View {
    Button(action: {
      showMailView.toggle()
    }) {
      Text("Send mail")
    }.disabled(!MailView.canSendMail)
    .sheet(isPresented: $showMailView) {
      MailView(data: $mailData) { result in
        print(result)
       }
    }
  }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
