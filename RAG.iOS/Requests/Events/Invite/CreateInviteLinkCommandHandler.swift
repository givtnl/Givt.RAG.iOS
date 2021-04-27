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
        
        let invitationLink = "Hi! I'm going to have a good run for: RAG - Raise And Give. Check it out! BTW, here's the link: http://givt-debug-rag-web.westeurope.azurecontainer.io/backer/register?eventId=\(request.eventId)&participantId=\(request.participantId)"
        
        try? completion(invitationLink as! R.TResponse)
    }

    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is CreateInviteLinkCommand
    }
}
