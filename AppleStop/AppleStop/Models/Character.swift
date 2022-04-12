//
//  Character.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/11.
//

import SwiftUI

struct Character {
    var image: Image?
    var name: String?
    var info: String?
}

var defaultCharacter: [Character] = [
    Character(image: ImageLiteral.imgBandal, name: "반달가슴곰", info: "반달가슴곰은 몸 전체가 검은색 털로 덮여있고 흰색 반달무늬를 가진 곰이에요. 울창한 산악지대에 서식하며 과실, 도토리 등의 식물성 먹이부터 꿀, 곤충, 갑각류의 동물성먹이까지 다양한 식성을 가지고 있어요. 옛날 대한민국전역의 분포가 5개체 내외로까지 줄어 멸종직전이었지만 활발한 복원활동과 보호 활동으로 개체 수가 점점 늘어나고 있답니다!"),
    Character(image: Image(systemName: "wand.and.stars.inverse"), name: "담비손담비", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구"),
    Character(image: Image(systemName: "moon.stars.fill"), name: "거우위우위", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"),
    Character(image: Image(systemName: "wand.and.stars.inverse"), name: "작은수달달", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구"),
    Character(image: Image(systemName: "moon.stars.fill"), name: "곰사찢반달곰", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"),
    Character(image: Image(systemName: "wand.and.stars.inverse"), name: "딱대촉새", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구"),
    Character(image: Image(systemName: "moon.stars.fill"), name: "정수리맨질맨질물범", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"),
    Character(image: Image(systemName: "wand.and.stars.inverse"), name: "장수거북", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구"),
    Character(image: Image(systemName: "moon.stars.fill"), name: "휘휘돌고래", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"),
    Character(image: Image(systemName: "wand.and.stars.inverse"), name: "족족제제비", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구"),
    Character(image: Image(systemName: "moon.stars.fill"), name: "후후후후후올빼미", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"),
    Character(image: Image(systemName: "wand.and.stars.inverse"), name: "검은머리어쩌구", info: "담비는 귀엽고 랩도 잘하고 머리부터 발끝까지 펄풱. 인생의 진리 어쩌구"),
    Character(image: Image(systemName: "moon.stars.fill"), name: "동글동글어쩌구", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~")
]
