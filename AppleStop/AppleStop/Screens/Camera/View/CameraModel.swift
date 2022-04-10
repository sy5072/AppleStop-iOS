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
    
    // MARK: - Custom Method
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
    
    func takePic(){
        
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
        }
        
    }
    
    func reTake(){
        DispatchQueue.global(qos: .background).async {
            
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
                self.isSaved = false
            }
        }
    }
    
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
    
    func savePic() {
        
        guard let image = UIImage(data: self.picData) else {
            print("error")
            return}
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        self.isSaved = true
        print("save success")
    }
}
