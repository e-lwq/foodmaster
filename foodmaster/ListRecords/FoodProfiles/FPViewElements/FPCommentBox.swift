import SwiftUI

struct FPCommentBox: View {
    @EnvironmentObject var LlistViewModel: LViewModel
    
    let result: FPCommentRecord
    
    var body: some View {
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
            
            Spacer()
            
        }.onAppear{
            LlistViewModel.fetch()
        }
    }
    
    func pr(){
        print(LlistViewModel.allresults.count)
        print(LlistViewModel.userIDs.count)
    }
    
    func getName(creatorID: String) -> String{
        let ind = LlistViewModel.userIDs.firstIndex(of: creatorID)
        let username = LlistViewModel.allresults[ind ?? 0].fields.name
        return username
    }
    func getRank(creatorID: String) -> String{
        let ind = LlistViewModel.userIDs.firstIndex(of: creatorID)
        let rank = LlistViewModel.allresults[ind ?? 0].fields.rank
        return rank
    }
}

struct FPCommentBox_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FPCommentBox(result: FPCommentRecord(fields: FPCommentField(creatorID: "000000", comment: "nice", FPID: "default", username: "fsdaf", rank: "Beginner")))
        }
        .environmentObject(LViewModel())
    }
}
