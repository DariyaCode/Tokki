//
//  ThemeManager.swift
//  Tokki
//
//  Created by Dariya Gecher on 27.05.2024.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @Published var darkModeEnabled: Bool = false
    init() {
        loadTheme()
    }
    
    var currentTheme: ColorScheme {
        darkModeEnabled ? .dark : .light
    }
    
    func toggleDarkMode() {
        darkModeEnabled.toggle()
        saveTheme()
    }
    
    private func saveTheme() {
        UserDefaults.standard.set(darkModeEnabled, forKey: "darkModeEnabled")
    }
    
    private func loadTheme() {
        darkModeEnabled = UserDefaults.standard.bool(forKey: "darkModeEnabled")
    }
}
