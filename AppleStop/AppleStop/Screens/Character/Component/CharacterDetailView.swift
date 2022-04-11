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
            characterImageView
            xmarkView
            detailInfo
                .padding(.top, 50)
            saveButton
        }
    }
}

extension CharacterDetailView {
    var detailInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("플라스틱을 혼쭐내는")
                .font(.system(size: 18, weight: .light, design: .default))
            Text("하늘다람쥐")
                .font(.system(size: 25, weight: .semibold, design: .default))
                .padding(.bottom, 5)
            Text("하늘다람쥐는 어쩌구 저쩌구 솰라솰라 어쩌구 저쩌구 하늘다람쥐 졸귀탱탱 짱귀여워 하늘 다람쥐.. ")
                .font(.system(size: 14, weight: .light, design: .default))
            
            Spacer()
        }
    }
    
    var xmarkView: some View {
        VStack {
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
            
            Spacer()
        }
        .padding(.top, 30)
    }
    
    var characterImageView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                Rectangle()
                    .frame(width: 62, height: 80, alignment: .center)
                    .opacity(0.5)
            }
            Spacer()
                .frame(height: 87)
        }
    }
    
    var saveButton: some View {
        VStack {
            Spacer()
            Button("변경", action: {
                self.presentationMode.wrappedValue.dismiss()
            })
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(Color.orange)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
            
            Spacer()
                .frame(height: 31)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
