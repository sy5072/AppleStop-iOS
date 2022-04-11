//
//  UserInformationView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/08.
//

import SwiftUI

struct UserInfomationView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 138)
            .cornerRadius(12)
            .shadow(color: .gray, radius: 3, x: 0, y: 2)
    }
}

struct UserInfomationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfomationView()
    }
}
