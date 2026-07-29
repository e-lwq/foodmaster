
import SwiftUI

struct MedalView: View {
    let lockedimg_name: String
    let img_name: String
    let yesno: Int
    let text: String
    
    var body: some View {
        VStack{
            if yesno==0{
                Image(lockedimg_name)
                    .resizable()
                    .frame(width:80, height:80)
            }else{
                Image(img_name)
                    .resizable()
                    .frame(width:80, height:80)
            }
            Text(text)
                .font(.caption)
                .frame(maxWidth: 140)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
    }
}

struct MedalView_Previews: PreviewProvider {
    static var previews: some View {
        MedalView(lockedimg_name: "crown_locked", img_name: "crown", yesno: 0, text: "Get full marks in the trivia 50 times")
    }
}
