//
//  PricingView.swift
//  Tokki
//
//  Created by Dariya Gecher on 10.06.2024.
//

import SwiftUI

struct PricingView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Your Cards")
            .navigationBarItems(trailing: Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "plus").bold()
            })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "creditcard.fill")
                .symbolVariant(.circle.fill)
                .font(.system(size: 24))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.red, .yellow.opacity(0.5))
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
            Text("4627 1001 0165 4724")
                .font(.title3.weight(.semibold))
            Text("12/2025")
                .font(.title3.weight(.medium))
            Text("777")
                .font(.title3.weight(.regular))
            HStack {
                Image(systemName: "signature")
                    .foregroundColor(.secondary)
                Text("Dariya Gecher")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: FutureView()) {
                Label("My purchases", systemImage: "cart")
            }
            NavigationLink(destination: FutureView()) {
                Label("Help with pricing", systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
}
