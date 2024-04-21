//
//  Suggestion.swift
//  Tokki
//
//  Created by Dariya Gecher on 02.12.2023.
//

import SwiftUI

struct Suggestion: Identifiable{
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "Words"),
    Suggestion(text: "Workbook")
]
