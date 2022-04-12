//
//  CharacterFrontView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/08.
//

import SwiftUI

struct CharacterCardFrontView: View {
    
    // MARK: - properties
    
    @Binding var degree : Double
    
    var characterImage = "flyingSquirrel"
    var characterName = "하늘다람쥐"
    var characterShortInfo = "플라스틱을 혼쭐내는"
    var characterHashtag = "#도토리는_나에게_양보해조"
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 336)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
                .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
                .shadow(color: .black.opacity(0.18), radius: 2, x: 0, y: 1)
            
            VStack{
                HStack {
                    Image(systemName: "folder.fill")
                    
                    Spacer()
                        .frame(width: 226)
                    
                    Image(systemName: "repeat")
                    
                }
                .padding(.horizontal, 26)
                .font(.system(size: 20))
                .foregroundColor(.iconGrey)
                
                Spacer()
                    .frame(height: 13)
                
                Image(characterImage).frame(width: 226, height: 166)
                
                Spacer()
                    .frame(height: 26)
                
                VStack(alignment: .leading) {
                    Text(characterShortInfo).font(.system(size: 20)) + Text(" ") + Text(characterName)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                        .frame(height: 8)
                    Text(characterHashtag)
                        .font(.system(size: 16))
                        .foregroundColor(.iconGrey)
                    Spacer()
                        .frame(height: 4)
                }
                .padding(.horizontal, 36)
                
            }
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CharacterFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardFrontView(degree: .constant(0))
    }
}
