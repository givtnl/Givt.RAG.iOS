//
//  User.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation
class User {
    var id: String?
    var name: String
    var email: String
    var eventId: String?
    var entryNumber: String?
    var startDate: Date?
    var endDate: Date?
    var distanceRanInMeters: Double?
    
    init(name: String, email: String, eventId: String, entryNumber: String?) {
        self.name = name
        self.email = email
        self.eventId = eventId
        self.entryNumber = entryNumber
    }
    
    func getAsProfileData() -> UserProfileData {
        let profile = UserProfileData()
        profile.email = self.email
        profile.userName = self.name
        return profile
    }
}
