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

    @AppStorage("isLevelUp") var isLevelUp : Bool = UserDefaults.standard.bool(forKey: "isLevelUp")
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    
    @State private var characters: [Character] = [Character(image: Image(systemName: "moon.stars.fill"), name: "날아라다람쥐", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"), Character(image: Image(systemName: "wand.and.stars.inverse"), name: "담비손담비", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구")]
    @State private var user: User = User(nickname: "연일읍분리수거왕", days: 150, level: 10, exp: 60, mainCharacterIndex: 1)
    
    private let data = Array(0...11)
    private let columns = [
        GridItem(.adaptive(minimum: Size.width), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            Color.backgroundGrey
                .ignoresSafeArea()
            
            ScrollView {
                UserInfomationView(nickname: user.nickname,
                                   usedDate: user.days,
                                   userLevel: user.level,
                                   userExp: user.exp)
                    .padding(.top, 22)
                    .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 28)
                
                LazyVGrid(columns: columns, spacing: 29) {
                    ForEach(data, id: \.self) { index in
                        let isMainCharacter: Binding<Bool> = markMainCharacter(index: index)
                        
                        if index < characters.count {
                            CharacterCardView(character: $characters[index],
                                              isMainCharacter: isMainCharacter)
                                .onTapGesture {
                                    if characters[index].name == nil {
                                        let randomCharacter = selectRandomCharacter()
                                        characters[characters.count - 1] = randomCharacter
                                    } else {
                                        self.viewController?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                            CharacterPopupView(character: $characters[index])
                                        }
                                    }
                                }
                        } else {
                            CharacterCardView(character: .constant(Character(image: nil, name: nil, info: nil)),
                                              isMainCharacter: isMainCharacter)
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .onAppear {
            isLevelUp = true
            setupNewCharacterConfiguration()
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
        let isMainCharacter: Binding<Bool> = (user.mainCharacterIndex == index) ? .constant(true) : .constant(false)
        
        return isMainCharacter
    }
    
    private func setupNewCharacterConfiguration() {
        if user.level % 5 == 0 && isLevelUp {
            characters.append(Character(image: ImageLiteral.imgNewcharacter, name: nil, info: nil))
            isLevelUp = false
        }
    }
    
    private func selectRandomCharacter() -> Character {
        let filteredCharacter = defaultCharacter.filter { !characters.map { $0.name }.contains($0.name) }
        let randInt = Int.random(in: 0..<filteredCharacter.count)
        
        return filteredCharacter[randInt]
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
