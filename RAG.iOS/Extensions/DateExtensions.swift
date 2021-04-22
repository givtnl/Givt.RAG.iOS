//
//  DateExtensions.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 22/04/2021.
//

import Foundation

extension Date {
    var formattedShort: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: self)
        }
    }
    var formattedLong: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMMM d, yyyy"
            return formatter.string(from: self)
        }
    }
    func formattedTimeSpan(until: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        let firstDateString = formatter.string(from: self)
        let endDateString = formatter.string(from: until)
        return "\(firstDateString) - \(endDateString)"
    }
}
