//
//  CreateInviteLinkCommandHandler.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 27/04/2021.
//

import Foundation

class CreateInviteLinkCommandHandler: RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        let request = request as! CreateInviteLinkCommand
        
        let invitationLink = "I'm running for Raise And Give! Do you have my back? Take a look at http://givt-debug-rag-web.westeurope.azurecontainer.io/backer/register?eventId=\(request.eventId)&participantId=\(request.participantId)"
        
        try? completion(invitationLink as! R.TResponse)
    }

    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is CreateInviteLinkCommand
    }
}
