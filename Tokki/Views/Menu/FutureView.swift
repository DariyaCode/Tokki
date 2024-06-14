//
//  FutureView.swift
//  Tokki
//
//  Created by Dariya Gecher on 10.06.2024.
//

import SwiftUI

struct FutureView: View {
    var body: some View {
        VStack{
            Text("Such functionality will be added at a later date".uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    FutureView()
}
