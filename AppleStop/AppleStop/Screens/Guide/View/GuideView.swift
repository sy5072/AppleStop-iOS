//
//  GuideView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct GuideView: View {
    
    @AppStorage("hideTabbar") var hideTabbar : Bool = false
    
    @State private var searchText = ""
    @State var searching = false
    
    var guideCards: [GuideCard] = GuideCard.sampleData
    
    var body: some View {
        NavigationView {
            ZStack{
                // 배경 색상
                Color.backgroundGrey
                    .ignoresSafeArea()
                VStack{
                    SearchBar(searchText: $searchText, searching: $searching)
                        .padding(.horizontal, 24)
                    GuideListView
                    
                }
            }
        }
    }
    
    var GuideListView: some View {
        
        ScrollView {
            VStack {
                ForEach(guideCards) {
                    // 필터링 기능이 들어가야 하는 자리
                    //                ForEach(guideCards.card.cardName.filter({ (cardName: String) -> Bool in return
                    //                    cardName.hasPrefix(searchText) || searchText == ""
                    //                }), id: \.self) {
                    
                    card in
                    NavigationLink(destination: GuideDetailView(card: card), label: {
                        CardView(card: card)
                    })
                    
                }
                .padding(.horizontal, 24)
            }
            .navigationTitle(searching ? "검색하기" : "logologo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
            .toolbar {
                if searching {
                    Button("Cancel") {
                        searchText = ""
                        withAnimation {
                            searching = false
                            UIApplication.shared.dismissKeyboard()
                        }
                    }
                }
            }
            .onAppear {
                hideTabbar = false
            }
            .gesture(DragGesture()
                        .onChanged({ _ in
                UIApplication.shared.dismissKeyboard()
            })
            )
        }
    }
    
    struct GuideView_Previews: PreviewProvider {
        static var previews: some View {
            
            GuideView(guideCards: GuideCard.sampleData)
            
        }
    }
}
