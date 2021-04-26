//
//  InAppUserQueryHandler.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 25/04/2021.
//

import Foundation

class InAppUserQueryHandler: RequestHandlerProtocol {
    let userStore = UserStore.shared
    
    func handle<R>(request: R, completion: @escaping (R.TResponse) throws -> Void) throws where R : RequestProtocol {
        var user: User? = nil
        if let dataUser = userStore.getUser(objectType: DataUser.self) {
            user = User(name: (dataUser as! DataUser).name, email: (dataUser as! DataUser).email)
            user?.id = (dataUser as! DataUser).id
        }
        try? completion(user as! R.TResponse)
    }
    
    func canHandle<R>(request: R) -> Bool where R : RequestProtocol {
        return request is InAppUserQuery
    }
}
