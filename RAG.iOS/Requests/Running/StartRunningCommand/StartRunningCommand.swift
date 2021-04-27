//
//  StartRunningCommand.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 20/04/2021.
//

import Foundation

class StartRunningCommand: RequestProtocol {
    typealias TResponse = Bool
    var user: User
    
    init(user: User) {
        self.user = user
    }
}
