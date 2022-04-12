//
//  UserInformationView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/08.
//

import SwiftUI

struct UserInfomationView: View {
    
    // MARK: - properties
    
    var nickname: String
    var usedDate: Int
    var userLevel: Int
    var userExp: Double = 30.0
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 138)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
            .overlay {
                innerView
                    .padding(.horizontal, 37)
            }
    }
}

extension UserInfomationView {
    var innerView: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 90, height: 96, alignment: .leading)
                .padding(.trailing, 32)
            userInfoView
        }
    }
    
    var userInfoView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(nickname)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .padding(.bottom, 3)
            Text("분리수거를 시작한 지 \(usedDate)일째")
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom)
            
            levelTextView
            
            ProgressView(value: userExp, total: 120)
                .tint(.mainGreen)
                .scaleEffect(x: 1, y: 1.7, anchor: .center)
                .padding(.top, 5)
        }
    }
    
    var levelTextView: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Lv.\(userLevel)")
                .font(.system(size: 14, weight: .medium, design: .default))
            Text("\(Int(userExp))/120")
                .font(.system(size: 10, weight: .regular, design: .default))
                .foregroundColor(.lightGrey)
        }
    }
}

struct UserInfomationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfomationView(nickname: "연일읍분리수거왕", usedDate: 150, userLevel: 10)
    }
}
