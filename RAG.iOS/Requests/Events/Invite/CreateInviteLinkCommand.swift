//
//  CreateInviteLinkCommand.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 27/04/2021.
//

import Foundation

class CreateInviteLinkCommand: RequestProtocol {
    typealias TResponse = String
    
    var eventId: String; var participantId: String
    
    init(eventId: String, participantId: String) {
        self.eventId = eventId; self.participantId = participantId
    }
    
}
