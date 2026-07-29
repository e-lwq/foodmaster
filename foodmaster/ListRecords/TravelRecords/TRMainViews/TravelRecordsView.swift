import SwiftUI

struct TravelRecordsView: View {
    
    @EnvironmentObject var TRlistViewModel: TRViewModel
    @EnvironmentObject var TRatViewModel: TRairtableViewModel
    @EnvironmentObject var Info: Information
    
    
    //let unused = TR_info(id: "", title: "", address: "", emoji_ind: 0, em: 0, notes: "", likes: 0, creatorID: "000000")
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    LRBackButton()
                    
                    NavigationLink(destination: FoodProfilesView()){
                        Image("TravelRecordsBar")
                            .resizable()
                            .frame(width: 300, height: 50)
                    }.padding()
                    
                    HStack{
                        NavigationLink(destination: ExampleTRView()){
                            Text("Example Travel Records")
                                .font(.title3)
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: TRSearchView()){
                            Text("Search")
                                .foregroundColor(.blue)
                                .font(.title3)
                                .padding(.horizontal)
                        }
                    }
                    
                    ScrollView(.horizontal){
                        //Text("testing")
                        HStack{
                            VStack(alignment: .leading){
                                NavigationLink(destination: MostLikedTravelRecordsView()){
                                    HStack{
                                        Text("Most Liked Records")
                                            .font(.title3)
                                            .frame(maxWidth: 180, alignment: .leading)
                                            .foregroundColor(.black)
                                        //Spacer()
                                        Image(systemName: "chevron.forward")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                    }
                                }
                                
                                List{
                                    ForEach(TRatViewModel.results2){item in
                                        NavigationLink(destination: MostLikedTravelRecordsDetailsView(item: TR_info(id: item.fields.TRID, title: item.fields.title, address: item.fields.address, emoji_ind: item.fields.emoji_ind, em: item.fields.em, notes: item.fields.notes, likes: item.fields.likes, creatorID: item.fields.creatorID), originView: 0)){
                                            
                                            TRItemsView(item: TR_info(id: item.fields.TRID, title: item.fields.title, address: item.fields.address, emoji_ind: item.fields.emoji_ind, em: item.fields.em, notes: item.fields.notes, likes: item.fields.likes, creatorID: item.fields.creatorID))
                                                
                                        }
                                    }
                                }.frame(width: 300)
                            }
                            .padding()
                            
                            VStack(alignment: .leading){
                                NavigationLink(destination: MyTravelRecordsView()){
                                    HStack{
                                        Text("My Travel Records")
                                            .font(.title3)
                                            .frame(maxWidth: 180, alignment: .leading)
                                            .foregroundColor(.black)
                                        //Spacer()
                                        Image(systemName: "chevron.forward")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                    }
                                }
                                
                                if(TRatViewModel.MyTravelRecords.count==0){
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 300, height: 50)
                                            .cornerRadius(10)
                                            .foregroundColor(.init(red:0.8, green: 0.92, blue: 0.98))
                                            .modifier(shadow_modifier())
                                        Text("Try create a Travel Record!")
                                            .frame(width: 300, height: 50, alignment: .leading)
                                    }
                                    .padding(7)
                                }
                                
                                
                                List{
                                    ForEach(TRatViewModel.MyTravelRecords) { item in
                                        NavigationLink(destination: TRAddView(item: item, title: item.title, address: item.address, emoji_ind: item.emoji_ind, em: item.em, notes: item.notes, isnew: false)){
                                            TRItemsView(item: item)
                                        }
                                    }
                                }
                                .frame(width: 300)
                                
                                
                            }
                            .padding()
                            
                        }
                    }
                    
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            TRatViewModel.fetch()
            TRatViewModel.fetchSpecificTravelRecords(creatorID: Info.userID)
        }
    }
}

struct TravelRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TravelRecordsView()
        }
        .environmentObject(TRViewModel())
        .environmentObject(TRairtableViewModel())
        .environmentObject(Information())
    }
}


/*
 cannot enter twice idk why
 the 2nd time i enter this screen from home page it always doesnt work
 */
