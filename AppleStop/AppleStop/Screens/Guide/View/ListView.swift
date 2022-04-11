//
//  ListView.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/09.
//

import SwiftUI

struct ListView: View {
    let cards: [GuideCard]
    
    // Scroll View가 필요합니다
    // 각 카드마다 따로 나뉘기도 해야하구요ㅎ

    var body: some View {
        ScrollView{
                ForEach(cards) {

                    card in CardView(card: card)

                }
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ListView(cards: GuideCard.sampleData)
    }
}

