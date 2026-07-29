import SwiftUI

struct EditButtonView: View {
    @Binding var showActionSheet: Bool
    
    var body: some View {
        Button{
            self.showActionSheet.toggle()
        }label:{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .overlay(
                    Image(systemName: "pencil")
                        .foregroundColor(.blue)
                        
                )
                .modifier(shadow_modifier())
        }
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView(showActionSheet: .constant(false))
    }
}
