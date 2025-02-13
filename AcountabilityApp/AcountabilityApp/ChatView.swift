import SwiftUI

struct ChatView: View {
    @State private var message: String = ""
    @State private var messages: [(text: String, isSentByUser: Bool)] = [
        ("Since YOU didn't make any UI", true),
        ("Like you SAID you would", true),
        ("The chatView sucks", true)
    ]

    var body: some View {
        VStack {
            // Chat messages list
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(messages.indices, id: \.self) { index in
                            ChatBubble(text: messages[index].text, isSentByUser: messages[index].isSentByUser)
                                .id(index)
                        }
                    }
                    .padding(.horizontal)
                }
                .onChange(of: messages.count) { _ in
                    withAnimation {
                        scrollView.scrollTo(messages.count - 1, anchor: .bottom)
                    }
                }
            }

            // Bottom text field with send button
            HStack {
                TextField("Message...", text: $message)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(UIColor.systemGray3), lineWidth: 1)
                    )

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding(10)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
        }
        .toolbar {
            ToolbarItem(placement: .principal) { // Centers it in the navigation bar
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)

                    Text("Jack")
                        .font(.headline)
                }
            }
        }
        //TODO: make the toolbar extend to include the name
        .navigationBarTitleDisplayMode(.inline)
    }

    private func sendMessage() {
        guard !message.isEmpty else { return }
        messages.append((text: message, isSentByUser: true))
        message = ""
    }
}

// Chat bubble for incoming & outgoing messages
struct ChatBubble: View {
    let text: String
    let isSentByUser: Bool

    var body: some View {
        HStack {
            if isSentByUser { Spacer() }
            Text(text)
                .padding()
                .background(isSentByUser ? Color.blue : Color(UIColor.systemGray4))
                .foregroundColor(isSentByUser ? .white : .black)
                .cornerRadius(16)
                .frame(maxWidth: 250, alignment: isSentByUser ? .trailing : .leading)
            if !isSentByUser { Spacer() }
        }
        .padding(.horizontal, 8)
    }
}

// Preview
#Preview {
    NavigationStack {
        ChatView()
    }
}
