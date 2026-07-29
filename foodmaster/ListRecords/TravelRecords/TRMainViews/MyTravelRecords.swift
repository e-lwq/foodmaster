import SwiftUI

struct MyTravelRecordsView: View {
    
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
                        /*.onTapGesture{
                            Info.update_foodawards(len: FPlistViewModel.FPitems.count)
                        }*/
                    
                    Text("My Travel Records")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    HStack{
                        Spacer()
                        NavigationLink(destination: TRAddView(item: unused, title: unused.title, address: unused.address, emoji_ind: unused.emoji_ind, em: unused.em, notes: unused.notes, isnew: true)){
                            Text("Add")
                                .font(.title3)
                                .padding(.trailing)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    
                    List{
                        ForEach(TRatViewModel.MyTravelRecords){item in
                            NavigationLink(destination: TRAddView(item: unused, title: unused.title, address: unused.address, emoji_ind: unused.emoji_ind, em: unused.em, notes: unused.notes, isnew: true)){
                                TRItemsView(item: item)
                            }
                        }
                        .onDelete(perform: {indexSet in
                            delete(indexSet: indexSet)
                        })
                    }.padding(.horizontal)
                    /*.onTapGesture{
                        Info.update_travelawards(len: TRatViewModel.MyTravelRecords.count)
                    }*/
                    
                    
                    Text(String(TRatViewModel.MyTravelRecords.count)+" in total")
                        .padding(.trailing, 20)
                        //.italic()
                        .font(.title3)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            TRatViewModel.fetch()
            TRatViewModel.fetchSpecificTravelRecords(creatorID: Info.userID)
        }
    }
    
    func delete(indexSet: IndexSet){
        for i in indexSet{
            TRatViewModel.deleteRecord(TRID: TRatViewModel.MyTravelRecords[i].id)
            TRatViewModel.MyTravelRecords.remove(at: i)
        }
    }
}

struct MyTravelRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MyTravelRecordsView()
        }
        //.environmentObject(FPViewModel())
        .environmentObject(TRairtableViewModel())
        .environmentObject(Information())
    }
}
