
import SwiftUI

struct OtherTRAddView: View {
    
    let item: TR_info
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        TRBackButton(ind: 3)
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 350, height: 50)
                                .foregroundColor(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                .padding(.bottom, 4)
                                .cornerRadius(8)
                            
                            Text(item.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: 350, maxHeight: 40, alignment: .leading)
                                .padding(.leading)
                                .font(.title3)
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
    }
}

struct OtherTRAddView_Previews: PreviewProvider {
    static var temp = TR_info(id: UUID().uuidString, title: "asdf", address: "dasas", emoji_ind: 0, em: 0, notes: "notes2", likes: 0, creatorID: "000000")
    static var previews: some View {
        NavigationView{
            OtherTRAddView(item: temp)
        }
    }
}
