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
        
        let request = request as! StopRunningCommand
        let command = FinishParticipantCommand(distanceInMeters: runningService.currentDistance.rounded(), finishDate: Date())
        ParticipantsAPI.finishEventForParticipant(eventId: request.user.eventId!, id: request.user.id!, finishParticipantCommand: command) { (response, error) in
            if let error = error {
                print(error)
            }
            try? completion(true as! R.TResponse)
        }
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is StopRunningCommand
    }
}
