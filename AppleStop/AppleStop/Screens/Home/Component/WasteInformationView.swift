//
//  WasteInformationView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/11.
//

import SwiftUI

struct WasteInformationView: View {
    
    @State var weeklyWasteData: [CGFloat] = [10, 20, 30, 30, 40, 50, 0]
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 150)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
                .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
                .shadow(color: .black.opacity(0.18), radius: 2, x: 0, y: 1)
            
            VStack{
                Text("분리수거 실천도").fontWeight(.medium).font(.system(size: 14))
                
                HStack(spacing: 10){
                    BarChartView(value: weeklyWasteData[0], day: "M")
                    BarChartView(value: weeklyWasteData[1], day: "T")
                    BarChartView(value: weeklyWasteData[2], day: "W")
                    BarChartView(value: weeklyWasteData[3], day: "T")
                    BarChartView(value: weeklyWasteData[4], day: "F")
                    BarChartView(value: weeklyWasteData[5], day: "S")
                    BarChartView(value: weeklyWasteData[6], day: "S")
                }.padding(.top, 6)
                
                
            }
        }
        
    }
}

struct BarChartView: View {
    
    var value: CGFloat
    var day: String
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 7, height: 60).foregroundColor(.chartGrey)
                Capsule().frame(width: 7, height: value).foregroundColor(.mainGreen)
                
            }
            Text(day).padding(.top, 4).font(.system(size: 10))
        }
    }
}

struct WasteInformationView_Previews: PreviewProvider {
    static var previews: some View {
        WasteInformationView()
    }
}
