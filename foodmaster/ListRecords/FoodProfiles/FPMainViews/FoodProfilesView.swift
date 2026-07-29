import SwiftUI

struct FoodProfilesView: View {
    
    @EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var FPatViewModel: FPairtableViewModel
    @EnvironmentObject var Info: Information
    
    var ExampleFPs = ExampleFP()
    
    let unused = FoodProfile_info(id: "", foodname: "", origin: "", places: "", notes: "", img: Image("unused"), likes: 0, creatorID: "000000")
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    LRBackButton()
                    
                    NavigationLink(destination: TravelRecordsView()){
                        Image("FoodProfilesBar")
                            .resizable()
                            .frame(width: 300, height: 50)
                    }.padding()
                    
                    
                    ScrollView{
                        HStack{
                            NavigationLink(destination: FPSearchView()){
                                Text("Search")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        VStack{
                            Text("Example Food Profiles")
                                .font(.title3)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(ExampleFPs.FPitems){item in
                                        NavigationLink(destination: OtherFoodProfilesEditView(item: item)){
                                            FoodProfileBox(item: item)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        
                        VStack(alignment: .leading){
                            NavigationLink(destination: MostLikedFoodProfilesView()){
                                HStack{
                                    Text("Most Liked Profiles")
                                        .font(.title3)
                                        .frame(maxWidth: 170, alignment: .leading)
                                        .foregroundColor(.black)
                                    //Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                }
                            }
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(FPatViewModel.results2){item in
                                        NavigationLink(destination: MostLikedFoodProfilesDetailsView(item: FoodProfile_info(id: item.fields.FPID, foodname: item.fields.foodname, origin: item.fields.origin, places: item.fields.places, notes: item.fields.notes, likes: item.fields.likes, creatorID: item.fields.creatorID), originView: 0)){
                                            
                                            FoodProfileBox(item: FoodProfile_info(id: item.fields.FPID, foodname: item.fields.foodname, origin: item.fields.origin, places: item.fields.places, notes: item.fields.notes, img: nil, likes: item.fields.likes, creatorID: item.fields.creatorID))
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading){
                            NavigationLink(destination: MyFoodProfilesView()){
                                HStack{
                                    Text("My Food Profiles")
                                        .font(.title3)
                                        .frame(maxWidth: 150, alignment: .leading)
                                        .foregroundColor(.black)
                                    //Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                }
                            }
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(FPatViewModel.MyFoodProfiles) { item in
                                        NavigationLink(destination: FoodProfilesEditView(item: item, foodname: item.foodname, origin: item.origin, places: item.places, notes: item.notes, img: item.img, isnew: false)){
                                            FoodProfileBox(item: item)
                                        }
                                    }
                                    if(FPatViewModel.MyFoodProfiles.count==0){
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 110, height: 160)
                                                .cornerRadius(10)
                                                .foregroundColor(.init(red:0.8, green: 0.92, blue: 0.98))
                                                .modifier(shadow_modifier())
                                            Text("Try create a Food Profile!")
                                                .frame(width: 110, height: 160)
                                        }
                                        .padding(7)
                                    }
                                }
                                
                            }
                        }
                        .padding()
                        
                    }
                    
                    
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            FPatViewModel.fetch()
            FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
        }
    }
}

struct FoodProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FoodProfilesView()
        }
        .environmentObject(FPViewModel())
        .environmentObject(FPairtableViewModel())
        .environmentObject(Information())
    }
}
