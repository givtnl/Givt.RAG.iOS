//
//  RegisterUserCommandHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation
import OpenAPIClient

class RegisterUserCommandHandler: RequestHandlerProtocol {
    
    let userStore = UserStore.shared
    
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        let command = request as! RegisterUserCommand
        
        let user: User = command.user
        
        ParticipantsAPI.registerParticipant(eventId: String(command.eventId), registerParticipantCommand: RegisterParticipantCommand(name: user.name)) { (participant, error) in
            guard let participant = participant else {
                try?completion(false as! R.TResponse)
                return
            }
            let user = DataUser()
            user.email = command.user.email
            user.name = command.user.name
            user.id = participant.id!
            user.eventId = command.eventId
            self.userStore.create(object: user)
            try?completion(true as! R.TResponse)
        }
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is RegisterUserCommand
    }
    
}
