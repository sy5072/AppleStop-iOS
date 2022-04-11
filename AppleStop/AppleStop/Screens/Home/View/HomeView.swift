//
//  HomeView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - properties
    
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    
    var body: some View {
        ZStack {
            Color.backgroundGrey
                .ignoresSafeArea()
            
            VStack {
                LocationInformationView()
                    .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 22)
                
                ZStack {
                    CharacterCardFrontView(degree: $frontDegree)
                        .padding(.horizontal, 24)
                    CharacterCardBackView(degree: $backDegree)
                        .padding(.horizontal, 24)
                }
                
                Spacer()
                    .frame(height: 22)
                
                HStack(spacing: 0.0) {
                    MiniInformationView()
                        .padding(.leading, 24)
                        .padding(.trailing, 12)
                    
                    MiniInformationView()
                        .padding(.trailing, 24)
                        .padding(.leading, 12)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
