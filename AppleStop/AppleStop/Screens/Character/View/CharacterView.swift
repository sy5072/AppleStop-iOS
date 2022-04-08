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
    
    let data = Array(1...16).map { "목록 \($0)"}
    let columns = [
        GridItem(.adaptive(minimum: Size.width), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            Color.backgroundGrey
                .ignoresSafeArea()
            
            ScrollView {
                UserInfomationView()
                    .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 28)
                
                LazyVGrid(columns: columns, spacing: 29) {
                    ForEach(data, id: \.self) { i in
                        CharacterCardView()
                    }
                }
                .padding(.horizontal, 24)
            }
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
