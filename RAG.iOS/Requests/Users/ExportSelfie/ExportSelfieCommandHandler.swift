//
//  ExportSelfieCommandHandler.swift
//  RAG.iOS
//
//  Created by Maarten Vergouwe on 29/04/2021.
//

import Foundation
import OpenAPIClient

class ExportSelfieCommandHandler: RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        let request = request as! ExportSelfieCommand
        AttachmentsAPI.getAttachmentDetail(eventId: request.eventId, participantId: request.participantId) { (attachmentDetail, error) in
            if error == nil,
               let attachmentDetail = attachmentDetail,
               let url = URL(string: attachmentDetail.uploadUrl!) {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "PUT"
                urlRequest.allHTTPHeaderFields?["Content-Type"] = "image/jpeg"
                let task = URLSession.shared.uploadTask(with: urlRequest, from: request.jpegData) { (data, result, error) in
                    if let error = error {
                        print(error)
                    }
                    try? completion(() as! R.TResponse)
                }
                task.resume()
            } else {
                try? completion(() as! R.TResponse)
            }
        }
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        request is ExportSelfieCommand
    }
}
