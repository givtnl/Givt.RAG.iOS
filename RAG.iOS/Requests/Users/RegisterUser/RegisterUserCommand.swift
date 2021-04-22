//
//  RegisterUserCommand.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation

class RegisterUserCommand: RequestProtocol {
    var user: User
    
    init(name: String, email: String) {
        self.user = User(name: name, email: email)
    }
    
    typealias TResponse = Bool
}
