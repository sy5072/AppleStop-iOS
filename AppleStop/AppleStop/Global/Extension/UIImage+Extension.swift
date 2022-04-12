//
//  UIImage+Extension.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/11.
//

import SwiftUI

// TODO: - Image위치좌표변수설정
// 이미지에 캐릭터 넣기
extension UIImage {
    // overlay any image on my image
    func overlayWith(image: UIImage) -> UIImage {
        let newSize = CGSize(width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        draw(in: CGRect(origin: CGPoint.zero, size: size))
        // edit CGPoint(x: ..., y: ...) part to adjust your watermark's position
        image.draw(in: CGRect(origin: CGPoint(x: size.width - 200, y: size.height - 200), size: image.size))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
