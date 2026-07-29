
import SwiftUI

struct EmojiView: View {
    let emoji: String
    let chosen: Bool
    var body: some View {
        Text(emoji)
            .font(.largeTitle)
            .padding(3.7)
            .background(chosen ? .gray.opacity(0.4) : .clear)
            .cornerRadius(100)
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(emoji: "😋", chosen: true)
    }
}
