//
//  CharacterView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        ScrollView {
            UserInfomationView()
                .padding(.horizontal, 24)
        }
            .navigationTitle("캐릭터 보관함")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
