//
//  Constants.swift
//  BB Quotes
//
//  Created by Joshua Arnold on 4/29/24.
//

import Foundation

enum Constants {
    static let bbName = "Breaking Bad"
    static let bcsName = "Better Call Saul"
}

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }

    var trimWhiteSpace: String {
        self.replacingOccurrences(of: " ", with: "")
    }

    var lowerNoSpaces: String {
        self.trimWhiteSpace.lowercased()
    }
}
