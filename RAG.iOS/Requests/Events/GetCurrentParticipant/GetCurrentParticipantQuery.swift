//
//  GetCurrentParticipantQuery.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 29/04/2021.
//

import Foundation

class GetCurrentParticipantQuery: RequestProtocol {
    typealias TResponse = Participant?
    var eventId: String
    var participantId: String
    
    init (eventId: String, participantId: String) {
        self.eventId = eventId
        self.participantId = participantId
    }
}
