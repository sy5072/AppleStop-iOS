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
    Character(image: Image(systemName: "moon.stars.fill"), name: "날아라다람쥐", info: "날아라 다람쥐는 귀엽습니다. 예쁘고 착한 편입니다. 날아라다람쥐야 행복해라~"),
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
