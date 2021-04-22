//
// ParticipantDetailModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ParticipantDetailModel: Codable {

    public var id: String?
    public var name: String?
    public var startDate: Date?
    public var finishDate: Date?
    public var distanceInMeters: Double?
    public var status: String?
    public var goals: [ParticipantGoalDetailModel]?

    public init(id: String? = nil, name: String? = nil, startDate: Date? = nil, finishDate: Date? = nil, distanceInMeters: Double? = nil, status: String? = nil, goals: [ParticipantGoalDetailModel]? = nil) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.finishDate = finishDate
        self.distanceInMeters = distanceInMeters
        self.status = status
        self.goals = goals
    }

}
