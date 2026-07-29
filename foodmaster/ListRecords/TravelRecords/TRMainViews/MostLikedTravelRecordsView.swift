import SwiftUI

struct MostLikedTravelRecordsView: View {
    
    //@EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var TRatViewModel: TRairtableViewModel
    @EnvironmentObject var Info: Information
    
    let unused = TR_info(id: "", title: "", address: "", emoji_ind: 0, em: 0, notes: "", likes: 0, creatorID: "000000")
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    TRBackButton(ind: 0)
                    
                    Text("Most Liked Travel Records")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    ScrollView{
                        VStack{
                            ForEach(TRatViewModel.results){ item in
                                NavigationLink(destination: MostLikedTravelRecordsDetailsView(item: TR_info(id: item.fields.TRID, title: item.fields.title, address: item.fields.address, emoji_ind: item.fields.emoji_ind, em: item.fields.em, notes: item.fields.notes, likes: item.fields.likes, creatorID: item.fields.creatorID), originView: 1)){
                                    MostLikedTravelRecordBox(title: item.fields.title, creatorID: item.fields.creatorID, likes: item.fields.likes)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            TRatViewModel.fetch()
        }
    }
}

struct MostLikedTravelRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MostLikedTravelRecordsView()
        }
        //.environmentObject(FPViewModel())
        .environmentObject(TRairtableViewModel())
        .environmentObject(Information())
    }
}
