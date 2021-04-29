//
//  GetAllEventsQueryHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 25/04/2021.
//

import Foundation
import OpenAPIClient

class GetAllEventsQueryHandler: RequestHandlerProtocol {
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        
        EventsAPI.getEventsList { (response, error) in            
            var events = [Event]()
            
            response?.forEach {
                events.append(Event(id: $0.id!, name: $0.name!, startDate: $0.startDate!, city: $0.city!, endDate: Date()))
            }
            
            try? completion(events as! R.TResponse)
        }
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is GetAllEventsQuery
    }
}
