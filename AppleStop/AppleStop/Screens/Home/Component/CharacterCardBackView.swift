//
//  CharacterCardBackView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/11.
//

import SwiftUI

struct CharacterCardBackView: View {
    
    // MARK: - properties
    
    @Binding var degree : Double
    
    var characterImage = "flyingSquirrel"
    var characterName = "하늘다람쥐"
    var characterHashtag = "#도토리는_나에게_양보해조"
    var characterShortInfo = "플라스틱을 혼쭐내는"
    var characterInfo = "하늘다람쥐는 어쩌구 저쩌구 솰라솰라 어쩌구 저쩌구 하늘다람쥐 졸귀탱탱 짱귀여워 하늘 다람쥐.."

    
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
                    .frame(height: 24)
                
                VStack(alignment: .leading) {
                    Text(characterShortInfo).font(.system(size: 20))
                    Text(characterName)
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                        .frame(height: 8)
                    Text(characterInfo)
                        .font(.system(size: 16))
                        .foregroundColor(.iconGrey)
                    Spacer()
                        .frame(height: 4)
                }.padding(.horizontal, 26)
                
                Spacer()
                    .frame(height: 10)
                
                
                Image(characterImage).resizable().aspectRatio(contentMode: .fit)
                    .padding(.leading, 205)
                    .frame(height: 100)
                    .opacity(0.5)
                
                
                
            }
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct CharacterCardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardBackView(degree: .constant(0))
    }
}
