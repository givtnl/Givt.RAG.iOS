//
// FinishParticipantCommand.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct FinishParticipantCommand: Codable {

    public var distanceInMeters: Double?
    public var finishDate: Date?

    public init(distanceInMeters: Double? = nil, finishDate: Date? = nil) {
        self.distanceInMeters = distanceInMeters
        self.finishDate = finishDate
    }

}
