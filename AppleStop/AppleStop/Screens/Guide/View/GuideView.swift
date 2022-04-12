//
//  GuideView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                
                // 서치바는 잠시 주석 속으로...
                /*
                SearchBar(text: $searchText)
                    .padding(.top, -30)
                */
                
                ListView(cards: GuideCard.sampleData)
                    .padding(.horizontal, 32)

            }
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
