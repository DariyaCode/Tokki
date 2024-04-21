//
//  Model.swift
//  Tokki
//
//  Created by Dariya Gecher on 02.12.2023.
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
