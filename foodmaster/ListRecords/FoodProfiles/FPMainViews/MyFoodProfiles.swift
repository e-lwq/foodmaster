import SwiftUI

struct MyFoodProfilesView: View {
    
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
                    
                    
                    Text("My Food Profiles")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
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
                            ForEach(FPatViewModel.MyFoodProfiles){item in
                                NavigationLink(destination: FoodProfilesEditView(item: item, foodname: item.foodname, origin: item.origin, places: item.places, notes: item.notes, img: item.img, isnew: false)){
                                    FoodProfileBox(item: item)
                                }
                            }
                        }.padding(.horizontal)
                    }
                    
                    Text(String(FPatViewModel.MyFoodProfiles.count)+" in total")
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
            FPatViewModel.fetch()
            FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
        }
    }
}

struct MyFoodProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MyFoodProfilesView()
        }
        //.environmentObject(FPViewModel())
        .environmentObject(FPairtableViewModel())
        .environmentObject(Information())
    }
}

/*
 objc[1775]: Class SBFCARendererImageRepresentation is implemented in both /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/SpringBoardFoundation.framework/SpringBoardFoundation (0x1530315a0) and /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/PaperBoardUI.framework/PaperBoardUI (0x1525d1930). One of the two will be used. Which one is undefined.
  
 
 NOT YET FINISH DELETE FUNCTION
 */
