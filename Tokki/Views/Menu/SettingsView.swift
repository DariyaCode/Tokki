//
//  SettingsView.swift
//  Tokki
//
//  Created by Dariya Gecher on 10.06.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Toggle("Notifications", isOn: .constant(false))
                }
                
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $themeManager.darkModeEnabled)
                        .onChange(of: themeManager.darkModeEnabled) { _ in
                            themeManager.toggleDarkMode()
                        }

                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(themeManager: ThemeManager())
    }
}


