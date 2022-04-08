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
            .shadow(color: .gray, radius: 3, x: 0, y: 2)
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView()
    }
}
