//
//  LocationInformationView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/10.
//

import SwiftUI

struct LocationInformationView: View {
 
    // MARK: - properties
    
    var location = "연일읍"
    var recyclingDay = "음식물쓰레기 배출일"
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 41)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
                .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
                .shadow(color: .black.opacity(0.18), radius: 2, x: 0, y: 1)
            HStack{
                Text("오늘은 '\(location)'의 \(recyclingDayColor)입니다")
            }.font(Font.headline.weight(.medium))
        }
    }

    var recyclingDayColor: Text {
        Text(recyclingDay).foregroundColor(.mainGreen)
    }
}

struct LocationInformationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationInformationView()
    }
}
