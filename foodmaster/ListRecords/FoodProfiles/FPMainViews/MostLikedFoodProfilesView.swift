import SwiftUI

struct MostLikedFoodProfilesView: View {
    
    //@EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var FPatViewModel: FPairtableViewModel
    @EnvironmentObject var Info: Information
    
    let unused = FoodProfile_info(id: "", foodname: "", origin: "", places: "", notes: "", img: Image(""), likes: 0, creatorID: "000000")
    let adaptivecolumns = [GridItem(.adaptive(minimum: 110, maximum: 160))]
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    FPBackButton(ind: 0)
                        /*.onTapGesture{
                         Info.update_foodawards(len: FPlistViewModel.FPitems.count)
                         }*/
                    
                    
                    Text("Most Liked Food Profiles")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    ScrollView{
                        VStack{
                            ForEach(FPatViewModel.results){ item in
                                NavigationLink(destination: MostLikedFoodProfilesDetailsView(item: FoodProfile_info(id: item.fields.FPID, foodname: item.fields.foodname, origin: item.fields.origin, places: item.fields.places, notes: item.fields.notes, likes: item.fields.likes, creatorID: item.fields.creatorID), originView: 1)){
                                    MostLikedFoodProfileBox(img: nil, foodname: item.fields.foodname, creatorID: item.fields.creatorID, likes: item.fields.likes)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            FPatViewModel.fetch()
        }
    }
}

struct MostLikedFoodProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MostLikedFoodProfilesView()
        }
        //.environmentObject(FPViewModel())
        .environmentObject(FPairtableViewModel())
        .environmentObject(Information())
    }
}
