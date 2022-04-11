//
//  CharacterView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct CharacterView: View {
    
    private enum Size {
        static let width = (UIScreen.main.bounds.size.width - 24 * 2 - 17) / 2
    }
    
    // MARK: - properties
    
    @State private var characters: [Character] = [Character(image: Image(systemName: "moon.stars.fill"), name: "날아라다람쥐", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"), Character(image: Image(systemName: "wand.and.stars.inverse"), name: "담비손담비", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구")]
    @State private var mainCharacterIndex: Int = 1
    
    private let data = Array(0...15)
    private let columns = [
        GridItem(.adaptive(minimum: Size.width), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            Color.backgroundGrey
                .ignoresSafeArea()
            
            ScrollView {
                UserInfomationView(nickname: "연일읍분리수거왕", usedDate: 150, userLevel: 10)
                    .padding(.top, 22)
                    .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 28)
                
                LazyVGrid(columns: columns, spacing: 29) {
                    ForEach(data, id: \.self) { index in
                        if index < characters.count {
                            CharacterCardView(characterImage: $characters[index].image,
                                              characterName: $characters[index].name,
                                              isMainCharacter: markMainCharacter(index: index))
                        }
                        
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .navigationTitle("캐릭터 보관함")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    print("back button")
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }
        }
    }
}

extension CharacterView {
    private func markMainCharacter(index: Int) -> Binding<Bool> {
        let isMainCharacter: Binding<Bool> = (mainCharacterIndex == index) ? .constant(true) : .constant(false)
        
        return isMainCharacter
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
