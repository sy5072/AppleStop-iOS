//
//  CameraModel.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/08.
//

import Foundation
import AVFoundation
import SwiftUI

class CameraModel : NSObject,ObservableObject,AVCapturePhotoCaptureDelegate {
    
    // MARK: - Properties
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    
    @Published var picData = Data(count:0)
    
    private let sessionQueue = DispatchQueue(label: "camera session queue")
    


    // MARK: - Custom Method
    
    //카메라 권한 요청
    func requestAndCheckPermissions(){
        
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized :
            setUp()
            return
        case .notDetermined :
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    
                    DispatchQueue.main.async {
                        self.setUp()

                    }
                }
            }
        case .denied :
            self.alert.toggle()
            return
        default :
            return
        
        }
    }
    
    //카메라 세션 설정
    func setUp(){
        
        do {
  
            self.session.beginConfiguration()
            
            guard let device = AVCaptureDevice.default(.builtInWideAngleCamera,for: .video,position: .back) else{
                print("디바이스 에러")
                return
            }
            
            let input = try AVCaptureDeviceInput(device: device)
            
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        }catch{
            print(error.localizedDescription)
        }
        
        
    }
    
    // 카메라 찍기
    func takePic(){
        
        sessionQueue.async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            //캡쳐완료전에 중단해버리면 딜리게이트 메소드 호출 안됨 -> 딜레이 0.1초 주어서 해결
            DispatchQueue.main.async {
                       Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                           self.session.stopRunning()
                       }
                   }
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
        }
        
    }
    
    // 카메라 다시찍기
    func reTake(){
        sessionQueue.async {
            
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
                self.isSaved = false
            }
        }
    }
    
    // 캡쳐완료 시 호출되는 함수
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        
        print("pic taken")
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("imageData nil")
            return}
        
        self.picData = imageData
        
    }
    
    // 캡쳐 저장
    func savePic() {
        
        guard let image = UIImage(data: self.picData) else {
            print("error")
            return}
        
        let watermark = UIImage(named: "character1")
        let newImage = image.overlayWith(image: watermark ?? UIImage())
        
        UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil)
        
        self.isSaved = true
        print("save success")
    }
}
