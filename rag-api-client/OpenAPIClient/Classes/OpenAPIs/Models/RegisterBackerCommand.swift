//
// RegisterBackerCommand.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RegisterBackerCommand: Codable {

    public var name: String?
    public var emailAddress: String?
    public var amount: Double?

    public init(name: String? = nil, emailAddress: String? = nil, amount: Double? = nil) {
        self.name = name
        self.emailAddress = emailAddress
        self.amount = amount
    }

}
