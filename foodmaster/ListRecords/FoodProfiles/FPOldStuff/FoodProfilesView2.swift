/*import SwiftUI

struct FoodProfilesView_original: View {
    
    @EnvironmentObject var FPlistViewModel: FPViewModel
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
                    
                    LRBackButton()
                        /*.onTapGesture{
                            Info.update_foodawards(len: FPlistViewModel.FPitems.count)
                        }*/
                    
                    
                    NavigationLink(destination: TravelRecordsView()){
                        Image("FoodProfilesBar")
                            .resizable()
                            .frame(width: 300, height: 50)
                    }.padding()
                    
                    HStack{
                        Spacer()
                        NavigationLink(destination: FoodProfilesEditView(item: unused, foodname: "", origin: "", places: "", notes: "", img: Image("noimage"), isnew: true)){
                            Text("Add")
                                .font(.title3)
                                .padding(.trailing)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    
                    ScrollView{
                        LazyVGrid(columns: adaptivecolumns , spacing: 10){
                            ForEach(FPlistViewModel.FPitems){item in
                                
                                NavigationLink(destination: FoodProfilesEditView(item: item, foodname: item.foodname, origin: item.origin, places: item.places, notes: item.notes, img: item.img, isnew: false)){
                                    FoodProfileBox(item: item)
                                }
                            }
                        }.padding(.horizontal)
                    }
                    Text(String(FPlistViewModel.FPitems.count)+" in total")
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

struct FoodProfilesView_Previews_original: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FoodProfilesView_original()
        }
        .environmentObject(FPViewModel())
        .environmentObject(Information())
    }
}


 objc[1775]: Class SBFCARendererImageRepresentation is implemented in both /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/SpringBoardFoundation.framework/SpringBoardFoundation (0x1530315a0) and /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/PaperBoardUI.framework/PaperBoardUI (0x1525d1930). One of the two will be used. Which one is undefined.
  
 
 NOT YET FINISH DELETE FUNCTION
 
*/
