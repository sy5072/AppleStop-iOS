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
    
    // Gestures Properties
    @State var offset : CGFloat = 0
    @State var lastOffset : CGFloat = 0
    @GestureState var gestureOffset : CGFloat = 0
    
    
    
    // MARK: - CameraView
    var body: some View {
        ZStack{
            
            CameraPreview(camera: camera)
            CodeGuideLineView()
            
            bottomView
            bottomSheetView
            
        }   .navigationTitle("카메라")
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
            .background(Color.backgroundGrey)
        
    }
}



struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


// MARK: - CameraPreview for UIkit
// 카메라미리보기창
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

// MARK: - Extension
extension CameraView {
    
    // 토글 및 버튼포함하는 뷰
    var bottomView : some View {
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
            
            Toggle(isOn: $isToggleOn) {}
            .toggleStyle(MyToggle())
            
            Button {
                // 카메라 촬영
                if isToggleOn {
                    camera.takePic()
                }
                // 바코드 촬영
                else{
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut, {
                            // TODO: -  디바이스 의존도 제거하기
                            offset = -270 // 범위내 임의값
                        })
                    }
                    
                }
            } label: {
                Image(isToggleOn ? "logo_camera" : "logo_barcode")
                    .resizable()
                    .frame(width: 90, height: 90)
            }
            
            .padding(.bottom,100)
            .padding(.top,20)
            
        }
    }
    // 바텀시트뷰
    var bottomSheetView : some View {
        GeometryReader{ geometryProxy -> AnyView in
            
            let height = geometryProxy.frame(in: .global).height
            return AnyView(
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 20))
                    
                    
                    VStack(spacing: 50){
                        Capsule()
                            .fill(Color.gray)
                            .frame(width: 60, height: 4)
                            .padding(.top)
                        
                        VStack(spacing: 10){
                            Text("플라스틱류")
                                .font(.title)
                                .foregroundColor(.green)
                            
                            HStack{
                                Image("plasticImage1")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                Image("plasticImage1")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            Text("페트병과 플라스틱 용기에 든 내용물은 깨끗이 비우고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발.")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                        }
                        
                        
                    }
                    .frame(maxHeight : .infinity, alignment: .top)
                    
                }
                    .offset(y: height - 70)
                    .offset(y: -offset > 0 ? (-offset <= (height - 70) ? offset : -(height - 70)) : 0)
                    .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.height
                        onChange()
                    })
                                .onEnded({ value in
                                    
                                    let maxHeight = height - 70
                                    withAnimation {
                                        
                                        if -offset > 70 && -offset < maxHeight / 2 {
                                            offset = -(maxHeight * 0.4)
                                        }
                                        else if -offset > maxHeight / 2 {
                                            offset = -maxHeight
                                        }
                                        else {
                                            offset = 0
                                        }
                                        lastOffset = offset
                                    }
                                })
                            )
                
            )
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    // 바텀시트 변경함수
    func onChange(){
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    
}
