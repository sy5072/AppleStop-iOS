//
//  CameraView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/07.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    // MARK: - Properties
    @State private var isToggleOn = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var camera = CameraModel()
    
    
    // MARK: - CameraView
    var body: some View {
        ZStack{
            CameraPreview(camera: camera)
            
            CodeGuideLineView()
            VStack(){
        
                
                if camera.isTaken{
                    
                    HStack {
                        Button {
                            camera.reTake()
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Capsule())
                    }
                        Button {
                            if !camera.isSaved{
                                camera.savePic()
                            }
                        } label: {
                            Text(camera.isSaved ? "saved" :"save")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                        
                        
                    }

                }
                
                Spacer()
                
                Toggle(isOn: $isToggleOn) {
                    
                }
                .toggleStyle(MyToggle())
                
                
                
                HStack{
                    
                  
                    
                    
                        Button {
                            // 카메라 촬영
                            if isToggleOn {
                                camera.takePic()
                                
                            }
                            // 바코드 촬영
                            else{
                                
                            }
                         } label: {
                            ZStack{
                                Image(isToggleOn ? "logo_camera" : "logo_barcode")
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                

                            }
                        }
                   
                }.padding(.bottom,100)
                    .padding(.top,20)
                
                
                
            }
        }.navigationTitle("카메라")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                        
                    }
                }
                
                
            }
            .onAppear {
                
                camera.requestAndCheckPermissions()
            }
    }
}







struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


// MARK: - CameraPreview for UIkit

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) ->  UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height*0.5)
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //
    }
}
