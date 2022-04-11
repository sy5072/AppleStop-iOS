//
//  CharacterCardView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/08.
//

import SwiftUI

struct CharacterCardView: View {
    private enum Size {
        static let width = (UIScreen.main.bounds.size.width - 24 * 2 - 16) / 2
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 165)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
            .overlay {
                innerView
            }
    }
}

extension CharacterCardView {
    var innerView: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "checkmark.square.fill")
                    .foregroundColor(.mainGreen)
            }
            .padding(.trailing, 11)
            
            Rectangle()
                .frame(width: 74, height: 95, alignment: .center)
            
            Text("하늘다람쥐")
                .font(.system(size: 12, weight: .light, design: .default))
        }
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView()
    }
}
