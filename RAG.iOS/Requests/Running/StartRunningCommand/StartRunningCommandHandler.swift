//
//  StartRunningCommandHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 20/04/2021.
//

import Foundation

class StartRunningCommandHandler : RequestHandlerProtocol {
    
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        print("Mediater works")
        try completion(true as! R.TResponse)
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is StartRunningCommand
    }
    
}
