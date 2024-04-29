//
//  Constants.swift
//  BB Quotes
//
//  Created by Joshua Arnold on 4/29/24.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
