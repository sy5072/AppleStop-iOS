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
        image.draw(in: CGRect(origin: CGPoint(x: size.width - 450, y: size.height - 450), size: image.size))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    static func imageResize (image:UIImage, sizeChange:CGSize)-> UIImage{

            let hasAlpha = true
            let scale: CGFloat = 0.0 // Use scale factor of main screen

            // Create a Drawing Environment (which will render to a bitmap image, later)
            UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)

        image.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))

            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

            // Clean up the Drawing Environment (created above)
            UIGraphicsEndImageContext()

            return scaledImage!
        }

          
}
