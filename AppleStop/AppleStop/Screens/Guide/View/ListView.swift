//
//  ListView.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/09.
//

import SwiftUI

struct ListView: View {
    let cards: [GuideCard]
    
    var body: some View {
            List {
                
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

