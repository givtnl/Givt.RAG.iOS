//
//  ExportSelfieCommand.swift
//  RAG.iOS
//
//  Created by Maarten Vergouwe on 29/04/2021.
//

import Foundation

struct ExportSelfieCommand: RequestProtocol {
    typealias TResponse = Void
    
    var participantId: String
    var eventId: String
    var jpegData: Data
}
