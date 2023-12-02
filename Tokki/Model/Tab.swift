//
//  Tab.swift
//  Tokki
//
//  Created by Dariya Gecher on 02.12.2023.
//

import SwiftUI

struct TableItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TableItem(text: "Learn now!", icon: "house", tab: .home, color: .teal),
    TableItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .blue),
    TableItem(text: "Notifications", icon: "bell", tab: .notifications, color: .red),
    TableItem(text: "Library", icon: "rectangle.stack", tab: .library, color: .pink),
]

enum Tab: String{
    case home
    case explore
    case notifications
    case library
}

struct TabPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
