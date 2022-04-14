//
//  User.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/11.
//

import Foundation

struct User {
    var days: Int
    var level: Int
    var exp: Double
    var mainCharacterIndex: Int
    var userCharacters: [Character]
}

var defaultUser: User = User(days: 150, level: 10, exp: 60, mainCharacterIndex: 0, userCharacters: defaultCharacter)
