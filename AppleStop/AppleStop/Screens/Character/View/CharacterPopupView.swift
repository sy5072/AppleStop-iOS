//
//  CharacterPopupView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/11.
//

import SwiftUI

struct CharacterPopupView: View {
    
    // MARK: - properties
    
    @Binding var character: Character
    @Binding var mainIndex: Int
    
    var currentCellIndex: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.popupGrey.opacity(0.3)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: geo.size.height / 2, alignment: .center)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
                    .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
                    .shadow(color: .black.opacity(0.18), radius: 2, x: 0, y: 1)
                    .padding(.horizontal, 25)
                    .overlay {
                        CharacterDetailView(characterImage: $character.image,
                                            characterName: $character.name,
                                            characterInfo: $character.info,
                                            mainCharacterIndex: $mainIndex,
                                            currentCellIndex: currentCellIndex)
                            .padding(.leading, 50)
                            .padding(.trailing, 45)
                    }
            }
            .background(BackgroundBlurView())
            .ignoresSafeArea()
        }
    }
}

struct CharacterPopupView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPopupView(character: .constant(Character(image: Image(systemName: "circle.fill"), name: "동그라미 땡", info: "동그라미 땡은 귀엽습니다.!")), mainIndex: .constant(1), currentCellIndex: 2)
    }
}
