import SwiftUI

struct Trivia_ProgressBar: View {
    
    var height: CGFloat = 13
    var width: CGFloat = 310
    var corr: CGFloat = 0
    var color1 = Color(.blue)
    var color2 = Color(.purple)
    
    var body: some View {
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width*corr/5, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]),
                                   startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }
        .padding()
    }
}

struct TriviaProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
