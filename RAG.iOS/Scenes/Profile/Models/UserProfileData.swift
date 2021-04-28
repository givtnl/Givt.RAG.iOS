//
//  UserProfileData.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import Foundation

class UserProfileData: ObservableObject {
    var userName: String = ""
    var email: String = ""
    var entryNumber: String = ""
    var averageRunDistance: Double = 0.0
    init() { }
    init(userName: String, email: String, entryNumber: String, averageRunDistance: Double) {
        self.userName = userName
        self.email = email
        self.entryNumber = entryNumber
        self.averageRunDistance = averageRunDistance
    }
}
