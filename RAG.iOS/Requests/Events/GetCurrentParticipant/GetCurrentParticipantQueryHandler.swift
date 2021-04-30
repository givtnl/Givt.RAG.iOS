//
//  GetCurrentParticipantQueryHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 29/04/2021.
//

import Foundation
import OpenAPIClient

class GetCurrentParticipantQueryHandler: RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        let query = (request as! GetCurrentParticipantQuery)
        ParticipantsAPI.getParticipantDetail(eventId: query.eventId, id: query.participantId) { response, error in
            
            guard let participant = response else {
                let notfound: Participant? = nil
                try? completion(notfound as! R.TResponse)
                return
            }
            
            var targets: [Target] = [Target]()
            
            participant.targets?.forEach({ target in
                targets.append(Target(type: target.type!.rawValue, value: target.value!))
            })
            
            try? completion(Participant(id: participant.id!, entryNumber: participant.entryNumber!, startDate: participant.startDate, finishDate: participant.finishDate, distanceInMeters: participant.distanceInMeters, status: participant.status!, targets: targets) as! R.TResponse)
        }
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is GetCurrentParticipantQuery
    }
    
    
}
