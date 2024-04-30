//
//  ContentView.swift
//  BB Quotes
//
//  Created by Joshua Arnold on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuoteView(show: Constants.bbName)
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            QuoteView(show: Constants.bcsName)
                .tabItem {
                    Label("Better Call Saul", systemImage: "briefcase")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
