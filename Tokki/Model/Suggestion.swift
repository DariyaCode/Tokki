//
//  Suggestion.swift
//  Tokki
//
//  Created by Dariya Gecher on 20.05.2024.
//

import SwiftUI

struct Suggestion: Identifiable{
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "Reading"),
    Suggestion(text: "Word list"),
    Suggestion(text: "Exersices"),
    Suggestion(text: "Workbook")
]
