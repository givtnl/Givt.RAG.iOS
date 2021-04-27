//
//  StartRunningCommandHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 20/04/2021.
//

import Foundation
import OpenAPIClient

class StartRunningCommandHandler : RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        ParticipantsAPI.startEventForParticipant(eventId: "65484", id: (request as! StartRunningCommand).user.id!) { (_, error) in
            print("Started running")
            try? completion(true as! R.TResponse)
        }
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is StartRunningCommand
    }
    
}
