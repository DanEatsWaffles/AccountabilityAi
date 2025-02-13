//
//  HomeView.swift
//  AcountabilityApp
//
//  Created by Daniel W on 2/11/25.
//

import SwiftUI

struct HomeView: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "item5"]
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        UltraThinListItem(title: item)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
