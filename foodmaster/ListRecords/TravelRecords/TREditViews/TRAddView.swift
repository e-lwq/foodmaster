
import SwiftUI

struct TRAddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var TRlistViewModel: TRViewModel
    @EnvironmentObject var Info: Information
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var TRatViewModel: TRairtableViewModel
    
    @State var item: TR_info
    @State var title: String
    @State var address: String
    @State var emoji_ind: Int
    @State var em: Int
    @State var notes: String
    let isnew: Bool

    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .center){
                        HStack{
                            Button{
                                cancelButton()
                            }label:{
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.leading, 30)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            //NavigationLink(destination:   TravelRecordsView()){Text("Save")}
                            
                            NavigationLink(destination: TravelRecordsView()){
                                Button{
                                    saveButton()
                                }label:{
                                    Text("Save")
                                        .foregroundColor(checkText() ? .blue : .gray)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .padding(.trailing, 30)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        
                        
                        TextField("Enter restaurant name", text: $title)
                            .frame(width: 350, height: 50)
                            .background(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                            .padding(.bottom, 20)
                            .cornerRadius(8)
                            .modifier(shadow_modifier())
                        
                        
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360, height: 690)
                                .foregroundColor(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                                .modifier(shadow_modifier())
                            
                            ScrollView{
                                VStack(alignment: .leading){
                                    TextField("Enter address", text: $address)
                                        .frame(width: 350, height: 50)
                                        .background(.white)
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(.bottom, 10)
                                        .cornerRadius(10)
                                        .padding(.leading, 4)
                                        .modifier(shadow_modifier())
                                    
                                    //emojis
                                    ZStack{
                                        Rectangle()
                                            .cornerRadius(10)
                                            .frame(width: 350, height: 60)
                                            .foregroundColor(.white)
                                            .modifier(shadow_modifier())
                                            .padding(.leading, 4)
                                        
                                        HStack(spacing: 25){
                                            EmojiView(emoji: "😍", chosen: emoji_ind==1)
                                                .onTapGesture{
                                                    emoji_ind = 1
                                                }
                                            
                                            EmojiView(emoji: "😋", chosen: emoji_ind==2)
                                                .onTapGesture{
                                                    emoji_ind = 2
                                                }
                                            EmojiView(emoji: "😐", chosen: emoji_ind==3)
                                                .onTapGesture{
                                                    emoji_ind = 3
                                                }
                                            EmojiView(emoji: "😖", chosen: emoji_ind==4)
                                                .onTapGesture{
                                                    emoji_ind = 4
                                                }
                                            EmojiView(emoji: "🤮", chosen: emoji_ind==5)
                                                .onTapGesture{
                                                    emoji_ind = 5
                                                }
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
                                            StarsView(tf: em>=1)
                                                .onTapGesture{
                                                    em=1
                                                }
                                            StarsView(tf: em>=2)
                                                .onTapGesture{
                                                    em=2
                                                }
                                            StarsView(tf: em>=3)
                                                .onTapGesture{
                                                    em=3
                                                }
                                            StarsView(tf: em>=4)
                                                .onTapGesture{
                                                    em=4
                                                }
                                            StarsView(tf: em>=5)
                                                .onTapGesture{
                                                    em=5
                                                }
                                            Spacer()
                                        }
                                        .padding(.leading)
                                    }
                                    
                                    Text("    Comments / Special info")
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .padding(.bottom, -4)
                                        .padding(.top, 4)
                                        //.italic()
                                    
                                    HStack{
                                        Spacer()
                                        TextEditor(text: $notes)
                                            .frame(width: 340, height: 200)
                                            .modifier(texteditor_modi())
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func saveButton(){
        if checkText(){
            if(isnew==false){
                TRatViewModel.updateRecord(TRID: item.id, title: title, address: address, emoji_ind: emoji_ind, em: em, notes: notes, likes: item.likes, creatorID: Info.userID)
            }else{
                let tmp_id = UUID().uuidString
                
                Info.update_travelawards(len: TRatViewModel.MyTravelRecords.count)
                Info.update_xp(add: Info.travelrecord_xp)
                
                LlistViewModel.updateRecord(userID: Info.userID, name: Info.username, xp: Int(Info.xp), rank: Info.ranks[Info.r], trivia_xp: Int(Info.trivia_xp))
                
                TRatViewModel.updateRecord(TRID: tmp_id, title: title, address: address, emoji_ind: emoji_ind, em: em, notes: notes, likes: 0, creatorID: Info.userID)
                
                TRatViewModel.fetch()
                TRatViewModel.fetchSpecificTravelRecords(creatorID: Info.userID)
                
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func cancelButton(){
        presentationMode.wrappedValue.dismiss()
    }
    
    func checkText() -> Bool{
        return title.count>0 && address.count>0 && emoji_ind>0 && em>0 && notes.count>0
    }
    
}


struct TRAddView_Previews: PreviewProvider {
    static var item = TR_info(id: UUID().uuidString, title: "Go to place a", address: "address a", emoji_ind: 2, em: 1, notes: "safd", likes: 0, creatorID: "000000")
    
    static var previews: some View {
        NavigationView{
            TRAddView(item: item, title: item.title, address: item.address, emoji_ind: item.emoji_ind, em: item.em, notes: item.notes, isnew: true)
                TRItemsView(item: item)
        }
        .environmentObject(TRViewModel())
        .environmentObject(Information())
        .environmentObject(LViewModel())
    }
}
