
import SwiftUI

struct MostLikedFoodProfilesDetailsView: View {
    @EnvironmentObject var FPatViewModel: FPairtableViewModel
    @EnvironmentObject var FPlistViewModel: FPViewModel //to save whether the user liked the item or not
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var Info: Information
    
    let item: FoodProfile_info
    let originView: Int
    //0 = All Food Profiles
    //1 = Most Liked Food Profiles
    //2 = FP Search View
    
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
                        FPBackButton(ind: originView)
                        
                        HStack{
                            if(item.img == nil){
                                Image("noimage")
                                    .resizable()
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .frame(width: 120, height: 150)
                                    .aspectRatio(contentMode: .fill)
                                    .padding()
                            }
                            else{
                                item.img?
                                    .resizable()
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .frame(width: 120, height: 150)
                                    .aspectRatio(contentMode: .fill)
                                    .padding()
                            }
                            
                            VStack(alignment: .leading, spacing: 10){
                                Spacer()
                                Text(item.foodname)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text(getName(creatorID: item.creatorID))
                                    .font(.title2)
                                    .foregroundColor(.black)
                                
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
                                
                                NavigationLink(destination: FPCommentsView(FPID: item.id)){
                                    Text("Comments")
                                        .foregroundColor(.blue)
                                        .font(.title3)
                                }
                                
                                Spacer()
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
                                Text("\n  Origin")
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
                                    
                                    Text(item.origin)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                Text("  Places where you ate this")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                
                                ZStack(alignment: .topLeading){
                                    Rectangle()
                                        .frame(width: 340, height: 200)
                                        .foregroundColor(Color.init(red: 0.98, green: 0.98, blue: 0.98))
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(4)
                                        .cornerRadius(8)
                                    
                                    Text(item.places)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                Text("  History / Background / Other notes")
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
            liked = FPlistViewModel.LikedFPs.contains(item.id)
            FPatViewModel.fetch()
            LlistViewModel.fetch()
        }
    }
    
    func Like(){
        if(liked == false){
            liked = true
            likes += 1
            FPlistViewModel.likeItem(FPID: item.id)
        }
        else{
            liked = false
            likes -= 1
            FPlistViewModel.unlikeItem(FPID: item.id)
        }
        
        FPatViewModel.updateRecord(FPID: item.id, foodname: item.foodname, origin: item.origin, places: item.places, notes: item.notes, likes: likes, creatorID: item.creatorID)
        
        FPatViewModel.fetch()
        FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
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

struct MostLikedFoodProfilesDetailsView_Previews: PreviewProvider {
    static var temp = FoodProfile_info(id: UUID().uuidString, foodname: "asdf", origin: "dasas", places: "dsas", notes: "notes2", img: Image("sandwich"), likes: 10, creatorID: "000000")
    static var previews: some View {
        NavigationView{
            MostLikedFoodProfilesDetailsView(item: temp, originView: 0)
        }
        .environmentObject(FPairtableViewModel())
        .environmentObject(FPViewModel())
        .environmentObject(LViewModel())
        .environmentObject(Information())
    }
}
