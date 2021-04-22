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
                print("user not registered")
                return
            }
            let user = DataUser()
            user.email = command.user.email
            user.name = command.user.name
            user.id = participant.id!
            self.userStore.create(object: user)
            print("user registered with id : \(user.id)")
            try?completion(false as! R.TResponse)
        }
        print("registering user with email \(user.email) and name \(user.name) for event with id \(command.eventId)")
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is RegisterUserCommand
    }
    
}
