//
//  GuideView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        /*
        SearchBar(text: $searchText)
            .padding(.top, -30)
        */
        
        ListView(cards: GuideCard.sampleData)
            .padding(.horizontal)
        // 중앙 정렬이 안되길래 강제로 패딩(가로) 넣었더니 갑자기 양 옆에 날개 생겼습니다 도와주세요
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
