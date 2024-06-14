//
//  HelpView.swift
//  Tokki
//
//  Created by Dariya Gecher on 10.06.2024.
//

import SwiftUI

struct HelpView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                Text("FAQs".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                questions
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Help")
        }
    }
    
    var profile: some View {
        VStack(spacing: 5) {
            Image(systemName: "person.3.sequence.fill")
                .symbolVariant(.circle.fill)
                .font(.system(size: 20))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .pink.opacity(0.8))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    BlobView()
                        .offset(x: -470, y: 190)
                        .scaleEffect(0.5)
                )
                .background(
                    BlobView()
                        .offset(x: 450, y: -180)
                        .scaleEffect(0.5)
                )
            Text("We're excited to invite you into our community!")
                .font(.title2.weight(.semibold))
            HStack {
                Image(systemName: "rectangle.stack.badge.person.crop.fill")
                    .foregroundColor(.secondary)
                Text("We already have over a thousand people with us")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: FutureView()) {
                Label("Community's page", systemImage: "cart")
            }
            NavigationLink(destination: FutureView()) {
                Label("Volunteer chat", systemImage: "hands.and.sparkles.fill")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var questions: some View {
        Section {
            NavigationLink(destination: FutureView()) {
                Label("How do I make the payment?", systemImage: "questionmark")
            }
            NavigationLink(destination: FutureView()) {
                Label("How do I join the community?", systemImage: "questionmark")
            }
            NavigationLink(destination: FutureView()) {
                Label("Can I get a mentor?", systemImage: "questionmark")
            }
            NavigationLink(destination: FutureView()) {
                Label("About Tokki", systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
}
