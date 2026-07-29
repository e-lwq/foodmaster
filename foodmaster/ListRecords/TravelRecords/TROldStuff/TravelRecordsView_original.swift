/*import SwiftUI

struct TravelRecordsView_original: View {
    
    @EnvironmentObject var TRlistViewModel: TRViewModel
    @EnvironmentObject var Info: Information
    
    let unused = TR_info(title: "", address: "", emoji_ind: 0, em: 0, notes: "", img: "")
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        LRBackButton()
                    }
                    .onTapGesture{
                        Info.update_travelawards(len: TRlistViewModel.TRitems.count)
                    }
                    
                    NavigationLink(destination: FoodProfilesView()){
                        Image("TravelRecordsBar")
                            .resizable()
                            .frame(width: 300, height: 50)
                    }.padding()
                    
                    HStack{
                        EditButton()
                            .font(.title3)
                            .padding(.leading)
                            /*.onTapGesture{
                                Info.update_travelawards(len: TRlistViewModel.TRitems.count)
                            }*/
                        Spacer()
                        NavigationLink(destination: TRAddView(item: unused, title: "", address: "", emoji_ind: 0, em: 0, notes: "", img: "", isnew: true)){
                            Text("Add")
                                .font(.title3)
                                .padding(.trailing)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    
                    List{
                        ForEach(TRlistViewModel.TRitems){item in
                            NavigationLink(destination: TRAddView(item: item, title: item.title, address: item.address, emoji_ind: item.emoji_ind, em: item.em, notes: item.notes, img: item.notes, isnew: false)){
                                TRItemsView(item: item)
                            }
                        }
                        .onDelete(perform: TRlistViewModel.deleteItem)
                        .onMove(perform: TRlistViewModel.moveItem)
                        .onTapGesture{
                            Info.update_travelawards(len: TRlistViewModel.TRitems.count)
                        }
                    }
                    
                    .background(Image("bg_color").resizable().ignoresSafeArea())
                    
                    Text(String(TRlistViewModel.TRitems.count)+" in total")
                        .padding(.trailing, 20)
                        //.italic()
                        .font(.title3)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
        
                }
            }
        }.navigationBarHidden(true)
    }
}

struct TravelRecordsView_original_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TravelRecordsView_original()
        }
        .environmentObject(TRViewModel())
        .environmentObject(Information())
    }
}

 
 cannot enter twice idk why
 the 2nd time i enter this screen from home page it always doesnt work
 
*/
