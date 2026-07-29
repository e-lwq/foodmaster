import SwiftUI

struct AwardsView: View{
    
    @EnvironmentObject var Info: Information
    
    let medals = ["bronze", "silver", "gold"]
    let medals_locked = ["bronze_locked", "silver_locked", "gold_locked"]
    let badges = ["bullseye", "pistol", "crown"]
    let badges_locked = ["bullseye_locked", "pistol_locked", "crown_locked"]
    let awards=[0,0,0]
    
    var body: some View{
        NavigationView{

            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                VStack(){
                    VStack(){
                        
                        HStack{
                            Spacer()
                            NavigationLink(destination: HomeView()){
                                Image(systemName: "house")
                                    .padding(20)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            }
                        }
                        Text("Medals")
                            .fontWeight(.bold)
                            .font(.title2)
                            .frame(alignment: .center)
                            .foregroundColor(.black)
                        
                        Text("\n    Food Profiles")
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal){
                            HStack{
                                MedalView(lockedimg_name: medals_locked[0], img_name: medals[0], yesno: Info.foods_awards[0], text: "Record 10 foods")
                                
                                MedalView(lockedimg_name: medals_locked[1], img_name: medals[1], yesno: Info.foods_awards[1], text: "Record 20 foods")
                                
                                MedalView(lockedimg_name: medals_locked[2], img_name: medals[2], yesno: Info.foods_awards[2], text: "Record 50 foods")
                            }
                        }
                        
                        
                        Text("\n    Travel Recrds")
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal){
                            HStack{
                                MedalView(lockedimg_name: medals_locked[0], img_name: medals[0], yesno: Info.travel_awards[0], text: "Travel to 10 places")
                                
                                MedalView(lockedimg_name: medals_locked[1], img_name: medals[1], yesno: Info.travel_awards[1], text: "Travel to 30 places")
                                
                                MedalView(lockedimg_name: medals_locked[2], img_name: medals[2], yesno: Info.travel_awards[2], text: "Travel to 50 places")
                            }
                        }
                        
                        Text("\n    Trivia")
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal){
                            HStack{
                                MedalView(lockedimg_name: badges_locked[0], img_name: badges[0], yesno: Info.trivia_awards[0], text: "Full marks x10")
                                    .padding(.leading)
                                
                                MedalView(lockedimg_name: badges_locked[2], img_name: badges[2], yesno: Info.trivia_awards[2], text: "Full marks x20")
                                
                                MedalView(lockedimg_name: badges_locked[2], img_name: badges[2], yesno: Info.trivia_awards[2], text: "Full marks x50")
                            }
                        }
                        
                        Text("Rank: "+Info.ranks[Info.r]+"   ")
                            .italic()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.callout)
                            .foregroundColor(.black)
                        
                        if Info.r<5{
                            Text("\nNext Rank: "+Info.ranks[Info.r+1]+"   ")
                                .italic()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.callout)
                                .foregroundColor(.black)
                        }
                        
                        
                    }
                    Spacer()
                    
                    TabBarView(sc: 5)
                }
            }
        }.navigationBarHidden(true)
    }
}


struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AwardsView()
        }.environmentObject(Information())
    }
}


/*
 doesnt update when i delete an item
 */
