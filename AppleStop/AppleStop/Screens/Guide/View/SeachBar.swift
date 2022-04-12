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
        HStack{
            
            TextField("분리수거 방법 검색 ...", text: $text)
                .padding()
                .background(Color(.systemGray6))
                .shadow(color: .black, radius: 12, x: 0, y: 0)
                .cornerRadius(12)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading)
                    }
                )
                .padding(.leading, 8)
            
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
            //.transition(.move(edge: .trailing))
                
        }
    }
}


struct SeachBar_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchBar(text: .constant(""))
    
    }
}
