//
//  StopRunningCommandHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 27/04/2021.
//

import Foundation
import OpenAPIClient

class StopRunningCommandHandler: RequestHandlerProtocol {
    var runningService = RunningService.shared;
    
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        print("Stopped running")
        
        ParticipantsAPI.finishEventForParticipant(eventId: "65484", id: (request as! StopRunningCommand).user.id!, finishParticipantCommand: FinishParticipantCommand(distanceInMeters: runningService.currentDistance)) { (_, error) in
            try? completion(true as! R.TResponse)
        }
        
        try? completion(true as! R.TResponse)
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is StopRunningCommand
    }
}
