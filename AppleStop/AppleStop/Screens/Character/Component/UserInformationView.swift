//
//  UserInformationView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/08.
//

import SwiftUI

struct UserInfomationView: View {
    
    // MARK: - properties
    
    @Binding var mainCharacterImage: Image?
    @AppStorage("nickname") var nickname : String = ""
    
    var usedDate: Int
    var userLevel: Int
    var userExp: Double = 30.0
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 138)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
            .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
            .shadow(color: .black.opacity(0.18), radius: 2, x: 0, y: 1)
            .overlay {
                innerView
                    .padding(.horizontal, 37)
            }
    }
}

extension UserInfomationView {
    var innerView: some View {
        HStack(spacing: 0) {
            mainCharacterImage?
                .resizable()
                .frame(width: 100, height: 100, alignment: .leading)
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
                .font(.system(size: 11, weight: .regular, design: .default))
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
        UserInfomationView(mainCharacterImage: .constant(Image(systemName: "circle.fill")), nickname: "연일읍분리수거왕", usedDate: 150, userLevel: 10)
    }
}
