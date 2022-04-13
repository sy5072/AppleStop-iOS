//
//  WasteInformationView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/11.
//

import SwiftUI

struct WasteInformationView: View {
    
    // MARK: - properties
    
    @State var weeklyWasteData: [CGFloat] = [70, 50, 60, 30, 40, 30, 0]
    
    var weeklyGoal: CGFloat = 50.0
    
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
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[0], day: "M")
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[1], day: "T")
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[2], day: "W")
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[3], day: "T")
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[4], day: "F")
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[5], day: "S")
                    BarChartView(goal: weeklyGoal, value: weeklyWasteData[6], day: "S")
                }.padding(.top, 6)
                
                
            }
        }
        
    }
}

struct BarChartView: View {
    
    var goal: CGFloat
    @ State var value: CGFloat
    var day: String
    
    @ State var startvalue = 0.0
    
    var animatableData: Double {
            get {
                self.startvalue
            }
            set {
                self.startvalue = newValue
            }
        }
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 7, height: 60).foregroundColor(.chartGrey)
                if startvalue>=goal {
                    Capsule().frame(width: 7, height: 60).foregroundColor(.mainGreen)
                } else {
                    Capsule().frame(width: 7, height: startvalue/goal*60).foregroundColor(.iconGrey)
                }
            }.animation(.spring(response: 2), value: startvalue).onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.startvalue = value
                    }
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
