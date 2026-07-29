
import SwiftUI

struct TRSearchView: View {
    
    @EnvironmentObject var TRatViewModel: TRairtableViewModel
    
    @State var restaurant = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    TRBackButton(ind: 0)
                    
                    TextField("Enter a restaurant name", text: $restaurant)
                        .frame(width: 350, height: 50)
                        .background(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        .padding(.bottom, 4)
                        .cornerRadius(8)
                    
                    Button{
                        searchButton(restaurant: restaurant)
                    }label:{
                        ZStack{
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 90, height: 40)
                                .cornerRadius(8)
                            Text("Search")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                    
                    List{
                        ForEach(TRatViewModel.tmp_results){item in
                            NavigationLink(destination: MostLikedTravelRecordsDetailsView(item: item, originView: 2)){
                                    
                                TRItemsView(item: item)
                            }
                        }
                    }
                    
                    Spacer()
                    
                }
            }
        }.navigationBarHidden(true)
    }
    
    func searchButton(restaurant: String){
        if restaurant.count > 0{
            TRatViewModel.fetchByName(title: restaurant)
        }
    }
}

struct TRSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TRSearchView()
        }.environmentObject(TRairtableViewModel())
    }
}
