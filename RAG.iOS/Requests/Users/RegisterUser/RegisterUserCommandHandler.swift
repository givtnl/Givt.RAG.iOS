//
//  RegisterUserCommandHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation

class RegisterUserCommandHandler: RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        
        let user: User = (request as! RegisterUserCommand).user
        
        print("registering user with email \(user.email) and name \(user.name)")
        
        try? completion(true as! R.TResponse)
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is RegisterUserCommand
    }
    
}
