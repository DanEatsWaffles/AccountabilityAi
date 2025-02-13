//
//  UltraThinListItem.swift
//  AcountabilityApp
//
//  Created by Daniel W on 2/13/25.
//

import SwiftUI

struct UltraThinListItem: View {
    var title: String = "Bot"
    var image: String = "person.fill"
    
    var body: some View {
        
        
        VStack(spacing: 8) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 5)

            Text(title)
                .font(.headline)
            Text("Lets pick up where we left off...")
                .font(.subheadline)
            
            // Chat Button
            NavigationLink(destination: ChatView()) {
                Text("Chat with AI")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.label))
                    .frame(width: 140, height: 30)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(UIColor.label), lineWidth: 1))
            }
            .padding(.bottom, 8)
        }
        .padding()
        .frame(width: 180)
        .background(RoundedRectangle(cornerRadius: 16).fill(.ultraThinMaterial).shadow(radius: 4))
    }
}

#Preview {
    UltraThinListItem()
}
