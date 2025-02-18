//
//  ContentView.swift
//  AcountabilityApp
//
//  Created by Daniel W on 1/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Text(Config.getAPIKey())
        HomeView()
    }
}

#Preview {
    ContentView()
}
