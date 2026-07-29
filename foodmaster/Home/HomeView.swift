import SwiftUI
import AVFoundation

struct HomeView: View {
    
    //@EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var FPatViewModel: FPairtableViewModel
    //@EnvironmentObject var TRlistViewModel: TRViewModel
    @EnvironmentObject var TRatViewModel: TRairtableViewModel
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var Info: Information
    @State var username = ""

    var body: some View {
            NavigationView{
                ZStack{
                    
                    Image("bg_color")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        
                        
                        HStack{
                            /*NavigationLink(destination: CreditsView()){
                                HStack{
                                    Text("   Credits")
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                }
                            }*/
                            NavigationLink(destination: RankingsView()){
                                Text("Game Rankings")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                    .padding(.leading)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "house.fill")
                                .font(.system(size: 25))
                                .padding(.trailing)
                        }
                        
                        Image(Info.ranks[Info.r])
                            .resizable()
                            .frame(width:200, height: 200)
                            .padding(-25)
                        
                        //xp bar
                        CompleteProgressBar()
                        
                        Text("   "+Info.ranks[Info.r])
                            .fontWeight(.bold)
                            .font(.title3)
                            .foregroundColor(.black)
                        
                        //text field for username
                        TextField("Username", text: $username)
                            .frame(width: 350, height: 50)
                            .background(Color.init(red: 0.71, green: 0.83, blue: 0.96))
                            .modifier(shadow_modifier())
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .onChange(of: username){ newValue in
                                if(checkUsername() && username != Info.username){
                                    saveUsername()
                                }
                            }
                        
                        //Text("\(LlistViewModel.allresults.count)")

                        HStack{
                            Spacer()
                            VStack{
                                NavigationLink(destination: FoodProfilesView()){
                                    VStack{
                                        Image("foodprofiles_homeicon")
                                            .resizable()
                                            .frame(width: 80, height: 60)
                                        Text("Food Profiles")
                                            .foregroundColor(.black)
                                            .modifier(text_modifier())
                                        ZStack{
                                            recta()
                                            Text("\(FPatViewModel.MyFoodProfiles.count)")
                                                .foregroundColor(.black)
                                                .font(.headline)
                                        }
                                    }
                                }
                            }
                            Spacer()
                            Spacer()
                            VStack{
                                NavigationLink(destination: TravelRecordsView()){
                                    VStack{
                                        Image("map_homeicon")
                                            .resizable()
                                            .frame(width: 80, height: 60)
                                        Text("Travel Records")
                                            .foregroundColor(.black)
                                            .modifier(text_modifier())
                                        ZStack{
                                            recta()
                                            Text("\(TRatViewModel.MyTravelRecords.count)")
                                                .foregroundColor(.black)
                                                .font(.headline)
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                        //end of hstack
                        //hstack2
                        HStack{
                            Spacer()
                            VStack{
                                NavigationLink(destination: TriviaStartView()){
                                    VStack{
                                        Image("questionmark_homeicon")
                                            .resizable()
                                            .frame(width: 80, height: 50)
                                        Text("Trivia xp")
                                            .foregroundColor(.black)
                                            .modifier(text_modifier())
                                        ZStack{
                                            recta()
                                            
                                            Text("\(Int(Info.trivia_xp))")
                                                .foregroundColor(.black)
                                                .font(.headline)
                                        }
                                    }
                                }
                            }
                            Spacer()
                            Spacer()
                            VStack{
                                ZStack{
                                    NavigationLink(destination: AwardsView()){
                                        VStack{
                                            Image("medal")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                            Text("Awards")
                                                .foregroundColor(.black)
                                                .modifier(text_modifier())
                                            ZStack{
                                                recta()
                                                Text("\(Info.awards)")
                                                    .foregroundColor(.black)
                                                    .font(.headline)
                                            }
                                        }
                                    }
                                }
                                /*.onTapGesture{
                                    Info.update_travelawards(len: TRlistViewModel.TRitems.count)
                                    Info.update_foodawards(len: FPlistViewModel.FPitems.count)
                                }*/
                            }
                            Spacer()
                        }
                        //end of hstack2
                        
                        NavigationLink(destination: LeaderboardView()){
                            ZStack{
                                Rectangle()
                                    .frame(width: 350, height: 50)
                                    .cornerRadius(10)
                                    .foregroundColor(.init(red: 0.96, green: 0.66, blue: 0.71))
                                    .modifier(shadow_modifier())
                                  
                                HStack{
                                    Spacer()
                                    Text("Leaderboard")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .foregroundColor(.blue)
                                    Spacer()
                                    Image(systemName: "crown.fill")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 30))
                                    Spacer()
                                }
                                .frame(width: 330)
                            }
                        }
                        VStack{
                            Spacer()
                            
                            TabBarView(sc: 0)
                                .padding(.top,10)
                        }
                        
                    }//vstack
                    .padding(.bottom)
                    
                    
                }
            }
            .navigationBarHidden(true)
            .onAppear{
                username = Info.username
                FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
                
                TRatViewModel.fetchSpecificTravelRecords(creatorID: Info.userID)
            }
    }
    
    func saveUsername(){
        Info.username = username
        LlistViewModel.updateRecord(userID: Info.userID, name: Info.username, xp: Int(Info.xp), rank: Info.ranks[Info.r], trivia_xp: Int(Info.trivia_xp))
    }
    
    func checkUsername() -> Bool{
        if(username != ""){return true}
        else{return false}
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

struct shadow_modifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: .gray.opacity(0.8), radius: 2.5, x: 2, y: 1)
    }
}

struct text_modifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 40)
            .font(.subheadline)
            //.fontWeight(.bold)
            .foregroundColor(.black)
            .padding(-10)
            .lineSpacing(1)
    }
}

struct recta: View{
    var body: some View{
        Rectangle()
            .frame(width: 70, height: 30)
            .cornerRadius(10)
            .foregroundColor(.yellow)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
        //.environmentObject(FPViewModel())
        .environmentObject(TRViewModel())
        .environmentObject(TriviaViewModel())
        .environmentObject(Information())
        .environmentObject(LViewModel())
        .environmentObject(FPairtableViewModel())
        .environmentObject(TRairtableViewModel())
    }
}

/*
 problems:
 - fix the leaderboard thing (should be ok now)
 - make sure user doesnt save empty username (done)
 
 - navigation link limitation
 
 - food profiles view:
 Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
 The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.

 - need to enter the screen again to see updates of food profiles and travel records
 */

/*
 
 
 right now
 
 - finish logic of food profiles (most liked)
   - connect to airtable /
   - delete function /
 
   - ********* add images *****************
 
   - need to enter the screen again to see updates
 
 - travel records /
   - finish the basic stuff (following the format of food profiles) /
   - make the example travel records /
   - connect to airtable /
   - make the most liked view /
   - code the logic and the buttons /
   - make sure all the views are properly designed and layered /
   - make delete function /
 
 - list and records:
   - search function /
   - comments (somehow cannot fetch comments)
   - add comments function
   - can make alert to tell user to enter at least 1 character when creating a comment
   - images (FP not yet)
   - back button for travel records /
 
 - fix the address text box for travel records example
 
 - user profiles
   - overall layout and screens
   - connect to airtable
   - zup saang
 
 - use phones storage to save userID (can use CoreData module)
 - generate userID for new users
 
 - trivia leaderboard
 
 - start view
 */

/*
 things to note:
 - i deleted all the LlistViewModel.fetch() in all .onAppear{} bodies
 */
