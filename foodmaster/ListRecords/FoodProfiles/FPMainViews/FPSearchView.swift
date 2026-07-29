
import SwiftUI

struct FPSearchView: View {
    let adaptivecolumns = [GridItem(.adaptive(minimum: 110, maximum: 160))]
    
    @EnvironmentObject var FPatViewModel: FPairtableViewModel
    
    @State var foodname = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    FPBackButton(ind: 0)
                    
                    TextField("Enter a food name", text: $foodname)
                        .frame(width: 350, height: 50)
                        .background(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        .padding(.bottom, 4)
                        .cornerRadius(8)
                    
                    Button{
                        searchButton(food: foodname)
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
                    
                    ScrollView{
                        LazyVGrid(columns: adaptivecolumns , spacing: 10){
                            ForEach(FPatViewModel.tmp_results){item in
                                NavigationLink(destination: MostLikedFoodProfilesDetailsView(item: item, originView: 2)){
                                    
                                    FoodProfileBox(item: item)
                                    
                                }
                            }
                        }.padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
    
    func searchButton(food: String){
        if food.count>0{
            FPatViewModel.fetchByName(name: foodname)
        }
    }
}

struct FPSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FPSearchView()
        }.environmentObject(FPairtableViewModel())
    }
}
