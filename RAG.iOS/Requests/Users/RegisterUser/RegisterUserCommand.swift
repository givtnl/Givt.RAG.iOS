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
    
    init(name: String, email: String, eventId: String, entryNumber: String?) {
        self.eventId = eventId
        self.user = User(name: name, email: email, eventId: eventId, entryNumber: entryNumber)
    }
    
    typealias TResponse = Bool
}
