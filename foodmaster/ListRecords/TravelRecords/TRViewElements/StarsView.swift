
import SwiftUI

struct StarsView: View {
    var tf: Bool
    
    var body: some View {
        Image(systemName: tf ? "star.fill" : "star")
            .font(.system(size: 25))
            .foregroundColor(.yellow)
            .padding(.leading, 8)
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(tf: true)
    }
}
