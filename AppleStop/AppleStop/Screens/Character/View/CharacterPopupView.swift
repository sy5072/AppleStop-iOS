//
//  CharacterPopupView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/11.
//

import SwiftUI

struct CharacterPopupView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.popupGrey.opacity(0.8)
                    .ignoresSafeArea()
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: geo.size.height / 2.5, alignment: .center)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
                    .padding(.horizontal, 25)
                    .overlay {
                        CharacterDetailView()
                    }
            }
        }
    }
}

struct CharacterPopupView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPopupView()
    }
}
