import SwiftUI

struct ContentView: View {
    @EnvironmentObject var Info: Information
    @EnvironmentObject var listViewModel: TGLViewModel
    @EnvironmentObject var TRlistViewModel: TRViewModel
    @EnvironmentObject var FPlistViewModel: FPViewModel
    @EnvironmentObject var TrivialistViewModel: TriviaViewModel
    @EnvironmentObject var LlistViewModel: LViewModel
    
    var body: some View {
        if(Info.username==""){
            UsernameView()
        }
        else{HomeView()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .environmentObject(TGLViewModel())
            .environmentObject(TRViewModel())
            .environmentObject(FPViewModel())
            .environmentObject(TriviaViewModel())
            .environmentObject(Information())
            .environmentObject(LViewModel())
    }
}
