//
//  ContentView.swift
//  Tokki
//
//  Created by Dariya Gecher on 02.12.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                SearchView()
            case .library:
                MatchedView()
            case .account:
                AccountView()
            }
            
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            
            if showModal {
                ModalView()
                    .zIndex(1)
        }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("MyPhone")
        }
        .environmentObject(Model())
    }
    
}
