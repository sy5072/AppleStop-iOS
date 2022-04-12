//
//  GuideDetailView.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/11.
//

import SwiftUI



struct GuideDetailView: View {
    
    let card: GuideCard
    
    // MARK: - Properties
    
    // video thumbnail values
    let videoThumbNailSize: CGFloat = 164
    let videoThumbNailFontSize: CGFloat = 28
    
    // text font size
    let largeTitleFontSize: CGFloat = 34
    let smallTitleFontSize: CGFloat = 20
    
    // Rectangle properties
    let cornerRadiusValue: CGFloat = 12
    
    let edgePaddingValue: CGFloat = 24
    
    var contentView: some View {
  
        VStack(
            alignment: .leading
        ){

            Text(card.cardName + "류")
            .font(
                .system(size: 34)
                // LargeTitle font size로 추후 수정
                .weight(.heavy)
            )
            .foregroundColor(.green)
            .multilineTextAlignment(.center)
            .accessibilityAddTraits(.isHeader)
            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
            .padding(.leading, edgePaddingValue)
            .padding(.top, edgePaddingValue)

            // TODO: 왜 바로 옆에 썼을 때만 볼드 처리가 되는가? 투두가 여러개인 경우에는?
            /*
             1. Rectangle 속에서 스크롤 뷰가 돌아다녀야 하는데 위로 적층되어있음.
                - 네모가 프레임이 될 수 있도록 수정할 것
             
             2. 밑에 Stepper이용해서 .... <- 이런 식으로 스냅 이동 가능하게 만들기

            */
            Rectangle()
                .frame(height: 324.0)
                //.frame(width: 221.0, height: 343.0)
                .foregroundColor(.white)
                .cornerRadius(18)
                .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
                
                .overlay {
                    innerView
                 }
                 
            // 가이드라인 제목
            Text(card.title + " 어떻게 배출해야 할까요?")
                .padding(.leading, 24)
                .padding(.vertical, 12)
                .font(
                    .system(size: 20)
                    // LargeTitle font size로 추후 수정
                    .weight(.heavy)
                )
            
            // 가이드라인 내용(detailGuideLine)
            Text(card.detailGuideLine)
                .padding(.horizontal, 24)
                .font(
                    .system(size: 16)
                    // LargeTitle font size로 추후 수정
                    .weight(.light)
                )
            
            Button("더보기") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .foregroundColor(.gray)
            .padding(.leading, 24.0)
            .padding(.top, 4)
            
            VStack(alignment: .center){
                Text("함께 보면 좋은 영상")
                    .font(
                        .system(size: 20)
                        // LargeTitle font size로 추후 수정
                        .weight(.heavy)
                    )
                    .padding(.leading, 24)
                    .padding(.vertical,12)
            }
            
            HStack{
                VStack{
                    // TODO: 텍스트 왼쪽 상단 정렬
                    Text("2022년\n분리수거\n개정안")
                        .font(
                            .system(size: videoThumbNailFontSize)
                            // LargeTitle font size로 추후 수정
                            .weight(.heavy)
                        )
                        .frame(width: videoThumbNailSize, height: videoThumbNailSize, alignment: .center)
                        .background(
                        Image("paper01")
                            .resizable()
                        )
                        .foregroundColor(.white)
                        .clipShape(Rectangle())
                        .cornerRadius(12)
                        .padding(.leading, edgePaddingValue)
                    
                    /*
                    Text("엄지맨")
                        .font(
                            .system(size: 14)
                            // LargeTitle font size로 추후 수정
                            .weight(.heavy)
                        )
                     */
                }

                Spacer()

                Text("클린동작의 시작,\n올바른 분리배출")
                    .font(
                        .system(size: videoThumbNailFontSize)
                        // LargeTitle font size로 추후 수정
                        .weight(.heavy)
                    )
                 .frame(width: videoThumbNailSize, height: videoThumbNailSize, alignment: .center)
                 .background(
                    Image("paper01")
                        .resizable()
                 )
                 .foregroundColor(.white)
                 .clipShape(Rectangle())
                 .cornerRadius(12)
                 .padding(.trailing, edgePaddingValue)

            }
                        
            // TODO: - 재활용 가능한 품목 리스트로 foreach로 쭈루룩 불러오기
            
            HStack {
                // 재활용 가능한 목록
                Label("재활용 O  ", systemImage: "recycle")
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.leading, edgePaddingValue)

                Text(card.recyclable[0])
            }
            .padding(.top, edgePaddingValue)

                
            HStack{
            // 재활용 불가능한 목록
            Label("재활용 X  ", systemImage: "recycle")
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.leading, edgePaddingValue)
            
            Text(card.unrecyclable[0])
            }

        }
        
    }
    
    var innerView: some View {
        
        ScrollView(.horizontal){
            
            HStack(alignment: .top)
            {
                /*
                 // TODO: 반복문 이용해서 카드 속 이미지 데이터 가져오게 하기
                 // 여러개의 String이 저장되어 있는 card.image 배열
                 // 0 ~ array.size - 1만큼 반복되는 반복문이 필요합니다
                 
                ForEach(card.image) {
                    image in card.image
                        Image(image)
                            .resizable()
                                .scaledToFill()
                                .frame(width: 420.0, height: 324.0)
                                .clipped()
                    
                }
                 */
                
                Image(card.image[0])
                    .resizable()
                        .scaledToFill()
                        .frame(width: 420.0, height: 324.0)
                        .clipped()
                Image(card.image[1])
                    .resizable()
                        .scaledToFill()
                        .frame(width: 420.0, height: 324.0)
                        .clipped()
                Image(card.image[0])
                    .resizable()
                        .scaledToFill()
                        .frame(width: 420.0, height: 324.0)
                        .clipped()
                Image(card.image[1])
                    .resizable()
                        .scaledToFill()
                        .frame(width: 420.0, height: 324.0)
                        .clipped()
            }
            .background(.white)
        }
    }
    
    var body: some View {
        
        ScrollView{
            contentView
        }
        
    }
    
}

struct GuideDetailView_Previews: PreviewProvider {
    
    // 임시 데이터 종이 #2
    static var card = GuideCard.sampleData[2]
    
    static var previews: some View {
        
        GuideDetailView(card: card)
        
    }
}
