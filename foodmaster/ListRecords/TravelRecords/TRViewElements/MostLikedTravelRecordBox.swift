import SwiftUI

struct MostLikedTravelRecordBox: View {
    
    @EnvironmentObject var LlistViewModel: LViewModel
    
    let title: String
    let creatorID: String
    let likes: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 70)
                .cornerRadius(10)
                .foregroundColor(.init(red: 0.984, green: 0.988, blue: 0.996))
                .modifier(shadow_modifier())
            
            HStack{
                VStack{
                    Text(title)
                        .font(.system(size: 25))
                        .frame(maxWidth: 150, maxHeight: 20, alignment: .leading)
                        .foregroundColor(.black)
                    Text(getName(creatorID: creatorID))
                        .font(.system(size: 15))
                        .frame(maxWidth: 150, maxHeight: 20, alignment: .leading)
                        .foregroundColor(.gray.opacity(0.7))
                }
                
                Spacer()
                
                VStack{
                    Text("\(likes)")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: 50, maxHeight: 15)
                    Text("likes")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
            }
        }
        .frame(width: 350, height: 70)
    }
    
    func getName(creatorID: String)-> String{
        LlistViewModel.fetch()
        
        if(LlistViewModel.userIDs.count > 0 && LlistViewModel.userIDs.contains(creatorID)){
            guard let ind = LlistViewModel.userIDs.firstIndex(of: creatorID) else { return "" }
            return LlistViewModel.allresults[ind].fields.name
        }
        return ""
    }
}

struct MostLikedTravelRecordBox_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MostLikedTravelRecordBox(title: "oliver's sandwich", creatorID: "000001", likes: 190)
        }.environmentObject(LViewModel())
    }
}
