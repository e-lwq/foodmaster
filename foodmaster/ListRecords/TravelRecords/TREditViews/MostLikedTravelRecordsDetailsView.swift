
import SwiftUI

struct MostLikedTravelRecordsDetailsView: View {
    @EnvironmentObject var TRatViewModel: TRairtableViewModel
    @EnvironmentObject var TRlistViewModel: TRViewModel //to save whether the user liked the item or not
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var Info: Information

    let item: TR_info
    let originView: Int
    
    @State var liked: Bool = false
    @State var likes: Int = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        TRBackButton(ind: originView)
                        
                        VStack(alignment: .leading, spacing: 10){
                            Spacer()
                            Text(item.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text(getName(creatorID: item.creatorID))
                                .font(.title2)
                                .foregroundColor(.black)
                            
                            Spacer()
                            Spacer()
                            
                            HStack{
                                Text("\(likes) likes")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                
                                Button{
                                    Like()
                                }label:{
                                    Image(systemName: liked ? "suit.heart.fill" : "suit.heart")
                                        .font(.system(size: 20))
                                        .foregroundColor(liked ? .init(red: 0.97, green: 0.57, blue: 0.67) : .black)
                                }
                            }
                            
                            Spacer()
                        }
                            
                            
                        
                        ZStack(alignment: .center){
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360, height: 750)
                                .foregroundColor(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                                .modifier(shadow_modifier())
                            
                            VStack(alignment: .leading){
                                Text("\n  Address")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                    .padding(.top, 10)
                                    //.fontWeight(.bold)
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 340, height: 50)
                                        .foregroundColor(Color.init(red: 0.98, green: 0.98, blue: 0.98))
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(4)
                                        .cornerRadius(8)
                                    
                                    Text(item.address)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                ZStack{
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 350, height: 60)
                                        .foregroundColor(.white)
                                        .modifier(shadow_modifier())
                                        .padding(.leading, 4)
                                    
                                    HStack(spacing: 25){
                                        EmojiView(emoji: "😍", chosen: item.emoji_ind==1)
                                        EmojiView(emoji: "😋", chosen: item.emoji_ind==2)
                                        EmojiView(emoji: "😐", chosen: item.emoji_ind==3)
                                        EmojiView(emoji: "😖", chosen: item.emoji_ind==4)
                                        EmojiView(emoji: "🤮", chosen: item.emoji_ind==5)
                                    }
                                }
                                
                                //rating
                                
                                Text("    Rating")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(-4)
                                    //.italic()
                                
                                ZStack{
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .frame(width: 340, height: 50)
                                        .modifier(shadow_modifier())
                                    
                                    HStack{
                                        StarsView(tf: item.em>=1)
                                        StarsView(tf: item.em>=2)
                                        StarsView(tf: item.em>=3)
                                        StarsView(tf: item.em>=4)
                                        StarsView(tf: item.em>=5)
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                                
                                
                                Text("  Comments / Special info")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                
                                ZStack(alignment: .topLeading){
                                    Rectangle()
                                        .frame(width: 340, height: 300)
                                        .foregroundColor(Color.init(red: 0.98, green: 0.98, blue: 0.98))
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(4)
                                        .cornerRadius(8)
                                    
                                    Text(item.notes)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
                
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            likes = item.likes
            liked = TRlistViewModel.LikedTRs.contains(item.id)
            TRatViewModel.fetch()
            LlistViewModel.fetch()
        }
    }
    
    func Like(){
        if(liked == false){
            liked = true
            likes += 1
            TRlistViewModel.likeItem(TRID: item.id)
        }
        else{
            liked = false
            likes -= 1
            TRlistViewModel.unlikeItem(TRID: item.id)
        }
        
        TRatViewModel.updateRecord(TRID: item.id, title: item.title, address: item.address, emoji_ind: item.emoji_ind, em: item.em, notes: item.notes, likes: likes, creatorID: item.creatorID)
        
        TRatViewModel.fetch()
        TRatViewModel.fetchSpecificTravelRecords(creatorID: Info.userID)
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

struct MostLikedTravelRecordsDetailsView_Previews: PreviewProvider {
    static var temp = TR_info(id: UUID().uuidString, title: "sdfsa", address: "fdsa", emoji_ind: 0, em: 0, notes: "fsaf", likes: 0, creatorID: "000000")
    static var previews: some View {
        NavigationView{
            MostLikedTravelRecordsDetailsView(item: temp, originView: 0)
        }
        .environmentObject(TRairtableViewModel())
        //.environmentObject(FPViewModel())
        .environmentObject(LViewModel())
        .environmentObject(Information())
    }
}
