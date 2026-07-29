import SwiftUI

struct UsernameView: View {
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var FPCommentsatViewModel: FPCommentsairtableViewModel
    @EnvironmentObject var Info: Information
    @Environment(\.presentationMode) var presentationMode
    
    @State var username = ""
    @State var flag = true
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    Text("Before you start using our app, please enter a username:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 380)
                    
                    TextField("Username", text: $username)
                        .frame(width: 350, height: 50)
                        .background(Color.init(red: 0.99, green: 0.99, blue: 0.99))
                        .modifier(shadow_modifier())
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    
                        .onChange(of: username){ newValue in
                            if(checkUsername()){flag=false}
                        }
                    
                    
                    Button{
                        if(checkUsername()){
                            //Info.userID = LlistViewModel.generateUSERID()
                            saveUsername()
                            //presentationMode.wrappedValue.dismiss()
                        }
                    }label:{
                        ZStack{
                            Rectangle()
                                .foregroundColor(checkUsername() ? .blue : .gray.opacity(0.3))
                                .frame(width: 80, height: 40)
                                .cornerRadius(10)
                            Text("Done")
                                .foregroundColor(checkUsername() ? .white : .gray)
                                .font(.title3)
                        }.padding()
                    }
                    .disabled(flag)
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func saveUsername(){
        Info.username = username
        
        LlistViewModel.updateRecord(userID: Info.userID, name: Info.username, xp: Int(Info.xp), rank: Info.ranks[Info.r], trivia_xp: Int(Info.trivia_xp))
        //FPCommentsatViewModel.
    }
    
    func checkUsername() -> Bool{
        if(username != ""){return true}
        else{return false}
    }
}

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UsernameView()
        }
        .environmentObject(Information())
        .environmentObject(LViewModel())
    }
}
