//
// RegisterParticipantCommand.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RegisterParticipantCommand: Codable {

    public var name: String?
    public var entryNumber: String?
    public var targets: [RegisterEventTargetCommand]?

    public init(name: String? = nil, entryNumber: String? = nil, targets: [RegisterEventTargetCommand]? = nil) {
        self.name = name
        self.entryNumber = entryNumber
        self.targets = targets
    }

}
