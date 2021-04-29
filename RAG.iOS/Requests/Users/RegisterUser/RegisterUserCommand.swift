//
//  RegisterUserCommand.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation

class RegisterUserCommand: RequestProtocol {
    var user: User
    var eventId: String
    var averageRunKm: Double
    
    init(name: String, email: String, eventId: String, entryNumber: String?, averageRunKm: Double) {
        self.eventId = eventId
        self.averageRunKm = averageRunKm
        self.user = User(name: name, email: email, eventId: eventId, entryNumber: entryNumber)
    }
    
    typealias TResponse = Bool
}
