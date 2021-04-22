//
// EventListModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct EventListModel: Codable {

    public var id: String?
    public var name: String?
    public var startDate: Date?
    public var city: String?

    public init(id: String? = nil, name: String? = nil, startDate: Date? = nil, city: String? = nil) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.city = city
    }

}