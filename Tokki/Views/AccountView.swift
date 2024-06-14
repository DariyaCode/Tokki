//
//  AccountView.swift
//  Tokki
//
//  Created by Dariya Gecher on 13.05.2024.
//
import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
//            .navigationBarItems(trailing: Button(action: { presentationMode.wrappedValue.dismiss() }) {
//                Text("Done").bold()
//            })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Dariya Gecher")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .foregroundColor(.secondary)
                Text("Kazakhstan")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: SettingsView(themeManager: themeManager)) {
                Label("Settings", systemImage: "gear")
            }

            NavigationLink(destination: PricingView()) {
                Label("Pricing", systemImage: "creditcard")
            }
            NavigationLink(destination: HelpView()) {
                Label("Help(Community)", systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://github.com/DariyaCode/CourseRoll")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button(action: { isPinned.toggle() }) {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}
