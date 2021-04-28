//
//  CaptureImageView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 27/04/2021.
//

import Foundation
import SwiftUI

struct CaptureImageView {
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var uiImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, uiImage: $uiImage)
    }
    
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        uiImage = context.coordinator.uiImage
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
