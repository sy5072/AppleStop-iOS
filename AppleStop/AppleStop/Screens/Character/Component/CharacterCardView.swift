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
    
    // MARK: - properties
    
    @Binding var characterImage: Image?
    @Binding var characterName: String?
    @Binding var isMainCharacter: Bool
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 165)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
            .overlay {
                selectCardStyle(name: characterName)
            }
    }
}

extension CharacterCardView {
    var characterInnerView: some View {
        VStack {
            checkMarkView
            .padding(.trailing, 11)
            
            characterImage?
                .resizable()
                .frame(width: 74, height: 95, alignment: .center)
            
            Text(characterName ?? "")
                .font(.system(size: 12, weight: .light, design: .default))
        }
    }
    
    var secretInnerView: some View {
        ImageLiteral.imgLock
            .frame(width: 49, height: 49)
    }
    
    var checkMarkView: some View {
        HStack {
            Spacer()
                            
            if isMainCharacter {
                Image(systemName: "checkmark.square.fill")
                    .foregroundColor(.mainGreen)
            } else {
                Image(systemName: "checkmark.square.fill")
                    .foregroundColor(.mainGreen)
                    .hidden()
            }
        }
    }
}

extension CharacterCardView {
    @ViewBuilder
    private func selectCardStyle(name: String?) -> some View {
        if name == nil {
            secretInnerView
        } else {
            characterInnerView
        }
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView(characterImage: .constant(Image(systemName: "star.fill")), characterName: .constant("별따라다람쥐"), isMainCharacter: .constant(false))
    }
}
