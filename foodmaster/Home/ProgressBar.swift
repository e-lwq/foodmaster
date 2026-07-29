import SwiftUI

struct ProgressBar: View {
    
    var height: CGFloat = 20
    var width: CGFloat = 310
    var percent: CGFloat = 0
    var color1 = Color(.blue)
    var color2 = Color(.green)
    
    var body: some View {
        let multiplier = width/100
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
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

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
