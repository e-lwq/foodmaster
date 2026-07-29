import SwiftUI

struct TRItemsView: View {
    let item: TR_info
    
    var body: some View {
            
        HStack{
            Text(item.emojis[item.emoji_ind]+" "+item.title)
                .foregroundColor(.black)
                .font(.title3)
                .padding(.leading)
            Spacer()
        }
        //.modifier(shadow_modifier())
    }
}

struct TRItemsView_Previews: PreviewProvider {
    static var item1 = TR_info(id: UUID().uuidString, title: "first", address: "dasfs", emoji_ind: 1, em: 1, notes: "dasff", likes: 0, creatorID: "000000")
    static var previews: some View {
        TRItemsView(item: item1)
    }
}
