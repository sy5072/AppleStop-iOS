//
//  CharacterDetailView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/11.
//

import SwiftUI

struct CharacterDetailView: View {
    
    // MARK: - properties
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                        .frame(width: 42, height: 42, alignment: .center)
                })

            }
            
            detailInfo
                .padding(.top, 50)
        }
    }
}

extension CharacterDetailView {
    var detailInfo: some View {
        VStack(alignment: .leading) {
            Text("플라스틱을 혼쭐내는")
                .font(.system(size: 20, weight: .light, design: .default))
            Text("하늘다람쥐")
                .font(.system(size: 25, weight: .semibold, design: .default))
            Text("하늘다람쥐는 어쩌구 저쩌구 솰라솰라 어쩌구 저쩌구 하늘다람쥐 졸귀탱탱 짱귀여워 하늘 다람쥐.. ")
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
