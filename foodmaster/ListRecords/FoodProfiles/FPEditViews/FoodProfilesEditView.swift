
import SwiftUI

struct FoodProfilesEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var Info: Information
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var FPatViewModel: FPairtableViewModel
    
    @State var item: FoodProfile_info
    @State var foodname: String
    @State var origin: String
    @State var places: String
    @State var notes: String
    @State var img: Image?
    let isnew: Bool
    
    @State var showActionSheet: Bool = false
    @State var showImagePicker: Bool = false
    @State var image : Image? = Image("noimage")
    @State var sourceType: Int = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        HStack{
                            if(!isnew){
                                Button{
                                    deleteButton()
                                }label:{
                                    Text("Delete")
                                        .foregroundColor(.red)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .padding(.leading, 30)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Button{
                                cancelButton()
                            }label:{
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.leading, 30)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button{
                                saveButton()
                            }label:{
                                Text("Save")
                                    .foregroundColor(checkText() ? .blue : .gray)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.trailing, 30)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }.padding(.top)
                        
                        image?
                            .resizable()
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 120, height: 150)
                            .aspectRatio(contentMode: .fill)
                            .overlay(
                                EditButtonView(showActionSheet: $showActionSheet)
                                    .offset(x: 55, y: 65)
                            )
                            .padding(.bottom)
                    
                        //Text(item.id)
                        Text("\(item.likes) likes")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        TextField("Enter food name", text: $foodname)
                            .frame(width: 350, height: 50)
                            .background(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                            .padding(.bottom, 4)
                            .cornerRadius(8)
                        
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360, height: 550)
                                .foregroundColor(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                                .modifier(shadow_modifier())
                            
                            VStack(alignment: .leading){
                                Spacer()
                                Text("\n  Origin")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                    .padding(.top)
                                    //.fontWeight(.bold)
                                
                                TextEditor(text: $origin)
                                    .frame(width: 340, height: 50)
                                    .modifier(texteditor_modi())
                                
                                Text("  Places where you ate this")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                
                                TextEditor(text: $places)
                                    .frame(width: 340, height: 100)
                                    .modifier(texteditor_modi())
                                    //.backgroundColor(.white)
                                    //.foregroundcolor(.black)
                                
                                Text("  History / Background / Other notes")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                
                                TextEditor(text: $notes)
                                    .frame(width: 340, height: 280)
                                    .modifier(texteditor_modi())
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
                
                if showImagePicker{
                    ImagePickerView(isVisible: $showImagePicker, image: $image, sourceType: sourceType)
                }
                
                
            }.actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                ActionSheet(title: Text("Select Image").foregroundColor(.black), message: Text("Please select an image from the photo gallery or use the camera").foregroundColor(.black), buttons:[
                    ActionSheet.Button.default(Text("Camera").foregroundColor(.black), action: {
                        self.sourceType = 0
                        self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.default(Text("Photo Gallery ").foregroundColor(.black), action: {
                            self.sourceType = 1
                            self.showImagePicker.toggle()
                        }),
                        ActionSheet.Button.cancel()
                ])
            })
        }
        .onAppear{
            self.image = img
        }
        .navigationBarHidden(true)
    }
    
    func saveButton(){
        if checkText(){
            if(isnew==false){
                //FPlistViewModel.updateItem(item: item, foodname: foodname, origin: origin, places: places, notes: notes, img: image)
                
                FPatViewModel.updateRecord(FPID: item.id, foodname: foodname, origin: origin, places: places, notes: notes, likes: item.likes, creatorID: Info.userID)
                
                FPatViewModel.fetch()
                FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
            }
            else{
                let tmp_id = UUID().uuidString
                //FPlistViewModel.addItem(id: tmp_id, foodname: foodname, origin: origin, places: places, notes: notes, img: image, likes: 0, creatorID: Info.userID)
                
                Info.update_foodawards(len: FPatViewModel.MyFoodProfiles.count)
                Info.update_xp(add: Info.foodprofile_xp)
                
                LlistViewModel.updateRecord(userID: Info.userID, name: Info.username, xp: Int(Info.xp), rank: Info.ranks[Info.r], trivia_xp: Int(Info.trivia_xp))
                
                FPatViewModel.updateRecord(FPID: tmp_id, foodname: foodname, origin: origin, places: places, notes: notes, likes: 0, creatorID: Info.userID)
                
                FPatViewModel.fetch()
                FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
                
                
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func deleteButton(){
        FPatViewModel.deleteRecord(FPID: item.id)
        FPatViewModel.fetch()
        FPatViewModel.fetchSpecificFoodProfiles(creatorID: Info.userID)
        //FPlistViewModel.deleteItem(item: item)
        
        presentationMode.wrappedValue.dismiss()
    }
    
    func cancelButton(){
        presentationMode.wrappedValue.dismiss()
    }
    
    func checkText() -> Bool{
        return foodname.count>0 && origin.count>0 && places.count>0 && notes.count>0
    }
}


struct texteditor_modi: ViewModifier{
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .shadow(color: .gray, radius: 1, x: 1, y: 1)
            .padding(.bottom, 5)
            .font(.title3)
            .foregroundColor(.black)
    }
}

struct text_modi: ViewModifier{
    func body(content: Content) -> some View {
        content
            //.fontWeight(.bold)
            .font(.title3.bold())
            .padding(-4)
            //.italic()
    }
}

struct FoodProfilesEditView_Previews: PreviewProvider {
    static var temp = FoodProfile_info(id: UUID().uuidString, foodname: "asdf", origin: "dasas", places: "dsas", notes: "notes2", img: Image("sandwich"), likes: 0, creatorID: "000000")
    
    static var previews: some View {
        NavigationView{
            FoodProfilesEditView(item: temp, foodname: temp.foodname, origin: temp.origin, places: temp.places, notes: temp.notes, img: temp.img, isnew: false)
        }
        //.environmentObject(FPViewModel())
        .environmentObject(Information())
        .environmentObject(LViewModel())
        .environmentObject(FPairtableViewModel())
    }
}
