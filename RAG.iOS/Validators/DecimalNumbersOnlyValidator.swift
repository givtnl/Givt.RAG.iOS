//
//  DecimalNumbersOnlyValidator.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 22/04/2021.
//

import Foundation

class DecimalNumbersOnlyValidator: ObservableObject {
    @Published var text = "" {
        didSet {
            let filtered = text.filter { $0.isNumber || $0 == "." || $0 == "," }
            if text != filtered {
                text = filtered
            }
        }
    }
}
