//
//  InviteBackerRepresentable.swift
//  RAG.iOS
//
//  Created by Maarten Vergouwe on 26/04/2021.
//

import Foundation
import SwiftUI

struct InviteBackerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController

    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
