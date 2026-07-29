
import SwiftUI

struct OtherFoodProfilesEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var Info: Information
    @EnvironmentObject var LlistViewModel: LViewModel
    
    let item: FoodProfile_info
    /*let foodname: String
    let origin: String
    let places: String
    let notes: String
    let img: Image?*/
    
    //var image : Image? = Image("noimage")
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        FPBackButton(ind: 0)
                        
                        if(item.img == nil){
                            Image("noimage")
                                .resizable()
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 120, height: 150)
                                .aspectRatio(contentMode: .fill)
                                .padding(.bottom)
                        }
                        else{
                            item.img?
                                .resizable()
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 120, height: 150)
                                .aspectRatio(contentMode: .fill)
                                .padding(.bottom)
                        }
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 350, height: 50)
                                .foregroundColor(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                .padding(.bottom, 4)
                                .cornerRadius(8)
                            
                            Text(item.foodname)
                                .foregroundColor(.black)
                                .frame(maxWidth: 350, maxHeight: 40, alignment: .leading)
                                .padding(.leading)
                                .font(.title3)
                        }
                        
                        ZStack(alignment: .center){
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360, height: 750)
                                .foregroundColor(Color.init(red: 0.87, green: 0.94, blue: 0.99))
                                .modifier(shadow_modifier())
                            
                            VStack(alignment: .leading){
                                Text("\n  Origin")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                    .padding(.top, 10)
                                    //.fontWeight(.bold)
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 340, height: 50)
                                        .foregroundColor(Color.init(red: 0.98, green: 0.98, blue: 0.98))
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(4)
                                        .cornerRadius(8)
                                    
                                    Text(item.origin)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                Text("  Places where you ate this")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                
                                ZStack(alignment: .topLeading){
                                    Rectangle()
                                        .frame(width: 340, height: 200)
                                        .foregroundColor(Color.init(red: 0.98, green: 0.98, blue: 0.98))
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(4)
                                        .cornerRadius(8)
                                    
                                    Text(item.places)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                Text("  History / Background / Other notes")
                                    .foregroundColor(.black)
                                    .modifier(text_modi())
                                
                                ZStack(alignment: .topLeading){
                                    Rectangle()
                                        .frame(width: 340, height: 300)
                                        .foregroundColor(Color.init(red: 0.98, green: 0.98, blue: 0.98))
                                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                        .padding(4)
                                        .cornerRadius(8)
                                    
                                    Text(item.notes)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 340, alignment: .leading)
                                        .padding(6)
                                        .font(.title3)
                                }
                                .padding(.bottom)
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct OtherFoodProfilesEditView_Previews: PreviewProvider {
    static var temp = FoodProfile_info(id: UUID().uuidString, foodname: "asdf", origin: "dasas", places: "dsas", notes: "notes2", img: Image("sandwich"), likes: 0, creatorID: "000000")
    static var previews: some View {
        NavigationView{
            OtherFoodProfilesEditView(item: temp)
        }
    }
}
