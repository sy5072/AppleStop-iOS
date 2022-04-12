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
    
    @State private var user: User = User(nickname: "연일읍분리수거왕", days: 150, level: 10, exp: 60, mainCharacterIndex: 0, userCharacters: [defaultCharacter[0], defaultCharacter[1]])
    
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    private let data = Array(0..<defaultCharacter.count)
    private let columns = [ GridItem(.adaptive(minimum: Size.width), spacing: 16) ]
    
    var body: some View {
        ZStack {
            Color.backgroundGrey
                .ignoresSafeArea()
            
            ScrollView {
                UserInfomationView(mainCharacterImage: $user.userCharacters[user.mainCharacterIndex].image,
                                   nickname: user.nickname,
                                   usedDate: user.days,
                                   userLevel: user.level,
                                   userExp: user.exp)
                    .padding(.top, 22)
                    .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 28)
                
                characterListView
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
    var characterListView: some View {
        LazyVGrid(columns: columns, spacing: 29) {
            ForEach(data, id: \.self) { index in
                let isMainCharacter: Binding<Bool> = markMainCharacter(index: index)
                
                if index < user.userCharacters.count {
                    CharacterCardView(character: $user.userCharacters[index],
                                      isMainCharacter: isMainCharacter)
                        .onTapGesture {
                            if user.userCharacters[index].name == nil {
                                let randomCharacter = selectRandomCharacter()
                                user.userCharacters[user.userCharacters.count - 1] = randomCharacter
                            } else {
                                self.viewController?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                    CharacterPopupView(character: $user.userCharacters[index],
                                                       mainIndex: $user.mainCharacterIndex,
                                                       currentCellIndex: index)
                                }
                            }
                        }
                } else {
                    CharacterCardView(character: .constant(Character(image: nil, name: nil, info: nil)),
                                      isMainCharacter: isMainCharacter)
                }
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
            user.userCharacters.append(Character(image: ImageLiteral.imgNewcharacter, name: nil, info: nil))
            isLevelUp = false
        }
    }
    
    private func selectRandomCharacter() -> Character {
        let filteredCharacter = defaultCharacter.filter { !user.userCharacters.map { $0.name }.contains($0.name) }
        let randInt = Int.random(in: 0..<filteredCharacter.count)
        
        return filteredCharacter[randInt]
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
