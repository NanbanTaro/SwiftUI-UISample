//
//  CameraPreview.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2023/12/24.
//  
//

import SwiftUI

struct CameraPreview: UIViewRepresentable {

    private var camerePreviewViewModel: CamerePreviewViewModel

    init(camerePreviewViewModel: CamerePreviewViewModel) {
        self.camerePreviewViewModel = camerePreviewViewModel
    }

    public func makeUIView(context: Context) -> some UIView {
        let cameraView = self.camerePreviewViewModel.previewView
        cameraView.frame = UIScreen.main.bounds
        self.camerePreviewViewModel.launchCamera()

        return cameraView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

import AVKit

class CamerePreviewViewModel: ObservableObject {

    var previewView: UIView = UIView()

    private var session: AVCaptureSession?
    private var photoOutput: AVCapturePhotoOutput?
    private var captureSetting: AVCapturePhotoSettings?

    func launchCamera() {
        if let session = self.session {
            DispatchQueue.global(qos: .background).async {
                session.startRunning()
            }
            return
        }

        guard let device = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back),
              let deviceInput = try? AVCaptureDeviceInput(device: device) else {
            return
        }

        let photoOutput = AVCapturePhotoOutput()
        let session = AVCaptureSession()
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            session.sessionPreset = .high
        default:
            session.sessionPreset = .photo
        }
        session.addInput(deviceInput)
        session.addOutput(photoOutput)

        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait
        videoPreviewLayer.frame = previewView.bounds


        DispatchQueue.global(qos: .background).async {
            session.startRunning()
        }

        self.photoOutput = photoOutput
        self.session = session

        previewView.layer.insertSublayer(videoPreviewLayer, at: 0)
    }
}
