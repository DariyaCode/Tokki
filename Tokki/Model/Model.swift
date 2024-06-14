//
//  Model.swift
//  Tokki
//
//  Created by Dariya Gecher on 20.05.2024.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
