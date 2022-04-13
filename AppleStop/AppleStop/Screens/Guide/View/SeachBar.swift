//
//  SeachBar.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/10.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        
        HStack {
            
            TextField("분리수거 방법을 검색하세요(ex. 플라스틱)", text: $text)
                .padding(.leading, 32)
                .padding(8)
                .background(.white)
                .customShadow()
            // 왜 그림자가 적용되질 않는거? 또 패딩에 가려졌나?
                .cornerRadius(6)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 12)
                            .foregroundColor(.black)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading)
                    }
                )
                .padding(.horizontal, 8)
            
            if isEditing {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
            
        if isEditing {
            Button(action: {
                self.isEditing = false
                self.text = ""
            }) {
                Text("취소")
            }
            .padding(.trailing, 12)
                
        }
    }
}


struct SeachBar_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchBar(text: .constant(""))
    
    }
}
