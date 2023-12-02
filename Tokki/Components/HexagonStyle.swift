//
//  HexagonStyle.swift
//  Tokki
//
//  Created by Dariya Gecher on 02.12.2023.
//

import SwiftUI

struct HexagonStyle: View {
    var body: some View {
        Canvas { context, size in
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HexagonStyle()
    }
}
