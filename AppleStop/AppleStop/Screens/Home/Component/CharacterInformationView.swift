//
//  CharacterInformationView.swift
//  AppleStop
//
//  Created by Mijoo Kim on 2022/04/08.
//

import SwiftUI

struct CharacterInformationView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 336)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
            .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
            .shadow(color: .black.opacity(0.18), radius: 2, x: 0, y: 1)
    }
}

struct CharacterInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInformationView()
    }
}
