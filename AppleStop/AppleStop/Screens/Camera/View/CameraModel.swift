//
//  CameraModel.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/08.
//

import Foundation
import AVFoundation
import SwiftUI
import Vision
class CameraModel : NSObject,ObservableObject,AVCapturePhotoCaptureDelegate {
    
    // MARK: - Properties
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var isToggleOn = false
    
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    @Published var isShowingToast = false
    
    @Published var showAlert = false
    @Published var showBottomSheet = false

   // @Published var barcodePayLoad = ""
    @Published var productKind = ""
    @Published var picData = Data(count:0)
     let sessionQueue = DispatchQueue(label: "camera session queue")
    


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
                    self.isTaken = true
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
                    self.isTaken = false
                }
                self.isSaved = false
                self.isShowingToast = false
                self.showBottomSheet = false

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
        
        // 바코드스캔
        if !isToggleOn{
        guard let cgImageRef = photo.cgImageRepresentation() else {
             return print("Could not get image representation")
           }
           
           print("Scanning image")
           scanImage(cgImage: cgImageRef)
        }
    }
    
    // 캡쳐 저장
    func savePic() {
        
        guard let image = UIImage(data: self.picData) else {
            print("error")
            return}
        
        let watermark = UIImage(named: "img_ddakchong")
        let newImage = image.overlayWith(image: watermark ?? UIImage())
        
        UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil)
        
        self.isSaved = true
        self.isShowingToast = true
        
        print("save success")
    }
    //  바코드 스캔
     func scanImage(cgImage: CGImage) {
       let barcodeRequest = VNDetectBarcodesRequest(completionHandler: { request, error in
         self.reportResults(results: request.results)
       })
       
       let handler = VNImageRequestHandler(cgImage: cgImage, options: [.properties : ""])
       
       guard let _ = try? handler.perform([barcodeRequest]) else {
         return print("Could not perform barcode-request!")
       }
     }
    
     func reportResults(results: [Any]?) {
       // Loop through the found results
       print("Barcode observation")

       guard let results = results else {
         return print("No results found.")
       }

       print("Number of results found: \(results.count)")

    //   for result in results {
         
         // Cast the result to a barcode-observation
         if !results.isEmpty{
         guard let barcode = results[0] as? VNBarcodeObservation else {return}
           
           if let payload = barcode.payloadStringValue {
             print("Payload: \(payload)")
               
               findProductKinds(barcode: payload)
           }
           
         } else{
             showAlert = true
         }
   //    }
    }
    
    
    func findProductKinds(barcode : String){
      
            APICaller.shared.getProductName(barcode : barcode) { [weak self]  result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let product):
                        self?.productKind =  product.PRDLST_DCNM!
                        print(self?.productKind)
                        self?.showBottomSheet = true
                        

                    case .failure(let error) :
                        print(error.localizedDescription)
                    }
                }
               
            }
        
          
        
    }
}
