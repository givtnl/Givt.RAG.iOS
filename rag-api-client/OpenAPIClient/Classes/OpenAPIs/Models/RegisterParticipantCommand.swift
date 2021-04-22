//
// RegisterParticipantCommand.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RegisterParticipantCommand: Codable {

    public var name: String?
    public var goals: [RegisterParticipantGoalCommand]?

    public init(name: String? = nil, goals: [RegisterParticipantGoalCommand]? = nil) {
        self.name = name
        self.goals = goals
    }

}