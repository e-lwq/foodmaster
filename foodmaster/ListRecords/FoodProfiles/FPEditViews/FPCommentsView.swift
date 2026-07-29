import SwiftUI

struct FPCommentsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var FPCommentsatViewModel: FPCommentsairtableViewModel
    @EnvironmentObject var LlistViewModel: LViewModel
    @EnvironmentObject var Info: Information
    
    let FPID: String
    
    @State var usernames: [String] = []
    @State var userRanks: [Record] = []
    @State var commentsInfos: [FPCommentRecord] = []
    @State var comments: [ [String] ] = []
    
    @State var commentFlag = false
    @State var commentText = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Button{
                        goBack()
                    }label:{
                        HStack{
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 18))
                            Text("Back")
                                .font(.title3)
                                .foregroundColor(.blue)
                            Spacer()
                        }.padding(.leading, 5)
                    }.padding(.leading, 5)
                    
                    Text("Comments")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Rectangle()
                        .frame(width: 400, height: 2)
                        .foregroundColor(.black)
                    
                    ScrollView{
                        ForEach(FPCommentsatViewModel.results){ result in
                            //Text(result.fields.comment)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    VStack{
                                        Image(result.fields.rank)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    VStack(alignment: .leading){
                                        Text(result.fields.username)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .font(.title3)
                                        Text(result.fields.comment)
                                            .foregroundColor(.black)
                                            .font(.title3)
                                        
                                        Spacer()
                                    }.padding(.horizontal)
                                }
                                Rectangle()
                                    .frame(width: 400, height: 1)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        
                        Button{
                            addComment()
                        }
                        label:{
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 50))
                                .modifier(shadow_modifier())
                                .padding(.horizontal)
                        }
                        
                    }
                }
                
                if(commentFlag==true){
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: 340, height: 180)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .modifier(shadow_modifier())
                            
                            VStack{
                                TextEditor(text: $commentText)
                                    .frame(width: 320, height: 120)
                                    .foregroundColor(.black)
                                    .modifier(shadow_modifier())
                                
                                HStack{
                                    Spacer()
                                    
                                    Button{
                                        cancelComment()
                                    }label:{
                                        Text("Cancel")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                    }
                                    
                                    Spacer()
                                    
                                    Button{
                                        postComment()
                                        FPCommentsatViewModel.fetch(FPID: FPID)
                                    }label:{
                                        Text("Post")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                
            }
        }
        .onAppear{
            FPCommentsatViewModel.fetch(FPID: FPID)
            LlistViewModel.fetch()
            
            
            
        }
    }
    
    func goBack(){
        presentationMode.wrappedValue.dismiss()
    }
    
    /*func getInfo(creatorID: String) -> [String]{
        if userIDs.contains(creatorID){
            let ind = userIDs.firstIndex(of: creatorID)
            let username = userInfos[ind ?? 0].fields.name
            let rank = userInfos[ind ?? 0].fields.name
            return [username, rank]
        }
        return ["",""]
    }
    func getName(creatorID: String) -> String{
        if LlistViewModel.userIDs.contains(creatorID){
            let ind = LlistViewModel.userIDs.firstIndex(of: creatorID)
            let username = LlistViewModel.allresults[ind ?? 0].fields.name
            return username
        }
        return ""
    }
    
    func getRank(creatorID: String) -> String{
        if LlistViewModel.userIDs.contains(creatorID){
            let ind = LlistViewModel.userIDs.firstIndex(of: creatorID)
            let rank = LlistViewModel.allresults[ind ?? 0].fields.rank
            return rank
        }
        return ""
    }*/
    
    func addComment(){
        commentFlag = true
        
        let tmp = LlistViewModel.userIDs
        let allUsers = LlistViewModel.allresults
        
        commentsInfos = FPCommentsatViewModel.results
        
        for result in commentsInfos{
            if tmp.contains(result.fields.creatorID){
                let ind = tmp.firstIndex(of: result.fields.creatorID)
                let username = (allUsers[ind ?? 0].fields.name)
                let userRank = (allUsers[ind ?? 0].fields.rank)
                
                comments.append([result.fields.comment, username, userRank])
            }
        }
        
        print(comments)
    }
    
    func cancelComment(){
        commentFlag = false
    }
    
    func postComment(){
        if(commentText.count>0){
            FPCommentsatViewModel.create_record(creatorID: Info.userID, comment: commentText, FPID: FPID, username: Info.username, rank: Info.ranks[Info.r])
            commentText = ""
            commentFlag = false
        }
    }
}

struct FPCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FPCommentsView(FPID: "default")
        }
        .environmentObject(FPCommentsairtableViewModel())
        .environmentObject(LViewModel())
        .environmentObject(Information())
    }
}
