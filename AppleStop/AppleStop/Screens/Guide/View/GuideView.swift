//
//  GuideView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct GuideView: View {

    @State private var searchText = ""
    
    var guideCards: [GuideCard] = GuideCard.sampleData
    
    var body: some View {
        NavigationView {
            
            ZStack{
                // 배경 색상
                Color.backgroundGrey
                    .ignoresSafeArea()
                
                GuideListView

            }
        }
    }
    
    var GuideListView: some View {
        
        ScrollView {
            VStack{
                ForEach(guideCards) {
                    
                    card in CardView(card: card)
                    
                }
            }
            
        }
        
    }
}


struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            GuideView(guideCards: GuideCard.sampleData)
        }
    }
}
