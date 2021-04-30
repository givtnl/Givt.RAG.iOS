//
//  Participant.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 30/04/2021.
//

import Foundation

struct Participant {
    var id: String
    var entryNumber: String
    var startDate: Date?
    var finishDate: Date?
    var distanceInMeters: Double?
    var status: String
    var targets: [Target]?
}

struct Target {
    var type: Int
    var value: String
}
