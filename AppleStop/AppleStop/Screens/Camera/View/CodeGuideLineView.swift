//
//  CodeGuideLineView.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/10.
//

import SwiftUI


struct CodeGuideLineView: View {
    var body: some View {
        
            GeometryReader{ geometryProxy in
                VStack {
                    RoundedRectangle(cornerRadius: 20).stroke(style: StrokeStyle(lineWidth: 5, dash: [4]))
                            .frame(width: geometryProxy.size.width / 2, height: geometryProxy.size.height / 10
                                   , alignment: .center)
                        .foregroundColor(Color.yellow)
  
                }
                .frame(width: geometryProxy.size.width, height: geometryProxy.size.height, alignment: .center)
            }
    }
}

struct CodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        CodeGuideLineView()
    }
}
