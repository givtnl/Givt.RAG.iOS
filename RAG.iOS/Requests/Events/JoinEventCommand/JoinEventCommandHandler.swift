//
//  JoinEventCommandHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation

class JoinEventCommandHandler: RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        print("Joining event with id \((request as! JoinEventCommand).eventId).")
        try? completion(true as! R.TResponse)
    }

    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is JoinEventCommand
    }
}
