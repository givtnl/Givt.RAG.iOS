//
//  JoinEventCommand.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation

class JoinEventCommand: RequestProtocol {
    typealias TResponse = Bool
    var eventId: Int
    
    init(eventId: Int) {
        self.eventId = eventId
    }
}
