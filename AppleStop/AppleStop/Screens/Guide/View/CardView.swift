//
//  CardView.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/09.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Card Property
    
    let cardThumbNailSize: CGFloat = 120
    let cardThumbNailCornerRadius: CGFloat = 10
    let cardPadding: CGFloat = 8
    
    let card: GuideCard

    var body: some View {
        VStack(alignment: .center){
            Rectangle()
                .frame(height: 324.0)
                .foregroundColor(.white)
                .cornerRadius(12)
                .overlay {
                    innerView
                        .padding(.horizontal, 32)
                }
                .customShadow()
        }
        
    }
    
    var innerView: some View {
        
        VStack(alignment: .center) {
            Text(card.cardName)
                .font(
                    .system(size: 24)
                    // small title font size로 수정할것
                    .weight(.heavy)
                )
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits([.isButton, .isHeader])
                .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                .padding(.top, cardPadding)
            
            HStack{
                
                // 왼쪽 이미지
                Image(card.image[0])
                    .resizable()
                                .scaledToFill()
                                .frame(width: cardThumbNailSize, height: cardThumbNailSize)
                                .clipped()
                                .cornerRadius(cardThumbNailCornerRadius)
                
                // 오른쪽 이미지
                Image(card.image[1])
                    .resizable()
                                .scaledToFill()
                                .frame(width: cardThumbNailSize, height: cardThumbNailSize)
                                .clipped()
                                .cornerRadius(cardThumbNailCornerRadius)
            }
            
            VStack(alignment: .leading){
                // TODO: - To the left!
                Text(card.guideLine)
                    .font(.system(size: 14))
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                    .padding(cardPadding)
                    .frame(width: 260.0)
                    .frame(height: 60.0)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var card = GuideCard.sampleData[0]
    static var previews: some View {
        CardView(card: card)
            .background(.white)
            .previewLayout(.sizeThatFits)
    }
}
