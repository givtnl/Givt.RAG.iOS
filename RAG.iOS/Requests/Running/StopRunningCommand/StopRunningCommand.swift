//
//  StopRunningCommand.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 27/04/2021.
//

import Foundation

class StopRunningCommand: RequestProtocol {
    var user: User
    typealias TResponse = Bool
    
    init(user: User) {
        self.user = user
    }
}
