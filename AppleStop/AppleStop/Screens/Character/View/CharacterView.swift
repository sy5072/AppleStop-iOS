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
    
    @State private var characters: [Character] = [Character(image: ImageLiteral.imgBandal, name: "반달가슴곰", info: "반달가슴곰은 몸 전체가 검은색 털로 덮여있고 흰색 반달무늬를 가진 곰이에요. 울창한 산악지대에 서식하며 과실, 도토리 등의 식물성 먹이부터 꿀, 곤충, 갑각류의 동물성먹이까지 다양한 식성을 가지고 있어요. 옛날 대한민국전역의 분포가 5개체 내외로까지 줄어 멸종직전이었지만 활발한 복원활동과 보호 활동으로 개체 수가 점점 늘어나고 있답니다!"), Character(image: Image(systemName: "wand.and.stars.inverse"), name: "담비손담비", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구")]
    @State private var user: User = User(nickname: "연일읍분리수거왕", days: 150, level: 10, exp: 60, mainCharacterIndex: 1)
    
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
                UserInfomationView(mainCharacterImage: $characters[user.mainCharacterIndex].image,
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
                
                if index < characters.count {
                    CharacterCardView(character: $characters[index],
                                      isMainCharacter: isMainCharacter)
                        .onTapGesture {
                            if characters[index].name == nil {
                                let randomCharacter = selectRandomCharacter()
                                characters[characters.count - 1] = randomCharacter
                            } else {
                                self.viewController?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                    CharacterPopupView(character: $characters[index],
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
