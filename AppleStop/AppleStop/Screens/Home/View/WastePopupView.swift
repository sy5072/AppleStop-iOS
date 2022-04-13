//
//  WastePopupView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/12.
//

import SwiftUI

struct WastePopupView: View {
    
    // MARK: - properties
    
    @Binding var showState: Bool
    
    @State var wasteDayData: [CGFloat] = [10, 20, 30, 30, 40, 50, 0]
    @State var wasteTypeData: [CGFloat] = [5,12,3,1,5,8]
    
    var wasteGoal = 10
    
    var body: some View {
        ZStack(alignment: .center){
                
//                Color.popupGrey.opacity(0.2)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 340, height: 500, alignment: .center)
                    .cornerRadius(12)
                    .customShadow()
                
                VStack{
                    Button(action: {
                        self.showState = false
                    } ){
                        Image(systemName: "xmark").frame(width: 42, height: 42, alignment: .center).padding(.top, 8).tint(.black)
                    }

                }.frame(width: 320, height: 500, alignment: .topTrailing)
   
                
                VStack{
                   Text("나의 분리수거 실천도").fontWeight(.medium).font(.system(size: 18))
                   
                    HStack(spacing: 26){
                        BarChartView(value: wasteDayData[0], day: "M")
                        BarChartView(value: wasteDayData[1], day: "T")
                        BarChartView(value: wasteDayData[2], day: "W")
                        BarChartView(value: wasteDayData[3], day: "T")
                        BarChartView(value: wasteDayData[4], day: "F")
                        BarChartView(value: wasteDayData[5], day: "S")
                        BarChartView(value: wasteDayData[6], day: "S")
                    }.padding(.top, 14)
                    
                    
                    VStack(spacing: 18){
                        HorizontalBarChartView(goal: CGFloat(wasteGoal), value: wasteTypeData[0], wasteType: "glass")
                        HorizontalBarChartView(goal: CGFloat(wasteGoal), value: wasteTypeData[1], wasteType: "plastic")
                        HorizontalBarChartView(goal: CGFloat(wasteGoal), value: wasteTypeData[2], wasteType: "vinyl")
                        HorizontalBarChartView(goal: CGFloat(wasteGoal), value: wasteTypeData[3], wasteType: "paper")
                        HorizontalBarChartView(goal: CGFloat(wasteGoal), value: wasteTypeData[4], wasteType: "rubber")
                        HorizontalBarChartView(goal: CGFloat(wasteGoal), value: wasteTypeData[5], wasteType: "can")
                    }.padding(.top, 20)
                }
                
                
            }
//            .background(BackgroundBlurView())
//            .ignoresSafeArea()
    }
}

struct HorizontalBarChartView: View {
    
    var goal: CGFloat
    var value: CGFloat
    var wasteType: String
    
    
    var body: some View {
        HStack(alignment: .center){
            Image(wasteType)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 30)
            
            ZStack(alignment: .leading){
                Capsule().frame(width: 205, height: 6).foregroundColor(.chartGrey)
                if value>goal {
                    Capsule().frame(width: 205, height: 6).foregroundColor(.mainGreen)
                } else {
                    Capsule().frame(width: value/goal*205, height: 6).foregroundColor(.mainGreen)
                }
                
            }.padding(.horizontal, 10)
            
            Text("\(Int(value/goal*100))%")
                .font(.system(size: 14))
                .frame(width: 40)
        }
    }
}

struct WastePopupView_Previews: PreviewProvider {
    static var previews: some View {
        WastePopupView(showState: .constant(true))
    }
}
