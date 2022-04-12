//
//  CustomToggle.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/08.
//

import Foundation
import SwiftUI

struct MyToggle : ToggleStyle {
    
    
    
func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 0){
                   configuration.label
                   Spacer()
                   Rectangle()
                       .foregroundColor(configuration.isOn ? .black : .green)
                       .frame(width: 86, height: 31, alignment: .center)
                       .overlay(
                        
                        
                        ZStack {
                            
                            if configuration.isOn {
                        Text("카메라촬영")
                                .font(.system(size: 8))
                                .padding(.trailing)
                                .foregroundColor(.white)
                            }
                            
                            Circle()
                                   .foregroundColor(.white)
                                   .padding(.all, 3)
                                   .overlay(
                                       Image(systemName: configuration.isOn ? "wand.and.stars" : "barcode.viewfinder")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .font(Font.title.weight(.black))
                                           .frame(width: 8, height: 8, alignment: .center)
                                           .foregroundColor(configuration.isOn ? .black : .green)
                                   )
                                   .offset(x: configuration.isOn ? 28 : -28, y: 0)
                                   .animation(Animation.linear(duration: 0.1),value: configuration.isOn)
                            
                        
                            if !configuration.isOn {
                        Text("바코드촬영")
                                .font(.system(size: 8))
                                .padding(.leading)
                                .foregroundColor(.white)

                            }
                        }
                        
                       )
                       
                       .cornerRadius(20)
                       .onTapGesture { configuration.isOn.toggle() }

        }
    .padding(.trailing,7)
    .frame(width: 86, height: 31)
}
}

