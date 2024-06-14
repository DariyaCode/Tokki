//
//  TokkiApp.swift
//  Tokki
//
//  Created by Dariya Gecher on 08.04.2024.
//

import SwiftUI

@main
struct TokkiApp: App {
    @StateObject var model = Model()
    @ObservedObject var themeManager = ThemeManager() // Создаем экземпляр ThemeManager
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(themeManager) // Передаем themeManager в окружение
        }
    }
}
