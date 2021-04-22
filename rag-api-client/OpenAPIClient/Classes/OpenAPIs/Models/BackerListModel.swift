//
// BackerListModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct BackerListModel: Codable {

    public var id: String?
    public var name: String?
    public var emailAddress: String?
    public var amount: Double?

    public init(id: String? = nil, name: String? = nil, emailAddress: String? = nil, amount: Double? = nil) {
        self.id = id
        self.name = name
        self.emailAddress = emailAddress
        self.amount = amount
    }

}
