
import SwiftUI

struct FoodProfileBox: View {
    
    let item: FoodProfile_info
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.init(red: 0.984, green: 0.988, blue: 0.996))
                .frame(width: 110, height: 160)
                .modifier(shadow_modifier())
            VStack{
                Spacer()
                
                if(item.img==nil){
                    Image("noimage")
                        .resizable()
                        .clipped()
                        .clipShape(Rectangle())
                        .frame(width: 100, height: 125)
                        .aspectRatio(contentMode: .fill)
                }
                else{
                    item.img?
                        .resizable()
                        .clipped()
                        .clipShape(Rectangle())
                        .frame(width: 100, height: 125)
                        .aspectRatio(contentMode: .fill)
                }
                
                
                Text(item.foodname)
                    .padding(-7)
                    .foregroundColor(.blue)
                Spacer()
                Spacer()
            }
            .frame(width: 110, height: 160)
        }
        .padding(7)
    }
}

struct FoodProfileBox_Previews: PreviewProvider {
    static var item1 = FoodProfile_info(id: UUID().uuidString, foodname: "dassd", origin: "dassf", places: "dssfa", notes: "sdafs", img: Image("sandwich"), likes: 0, creatorID: "000000")
    static var previews: some View {
        FoodProfileBox(item: item1)
    }
}
