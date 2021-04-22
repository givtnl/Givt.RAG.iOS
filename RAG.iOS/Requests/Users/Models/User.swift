//
//  User.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation
class User {
    var id: Int?
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}