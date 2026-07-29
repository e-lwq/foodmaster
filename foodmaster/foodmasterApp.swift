import SwiftUI

@main
struct foodmasterApp: App {
    
    @StateObject var listViewModel: TGLViewModel = TGLViewModel()
    @StateObject var TRlistViewModel: TRViewModel = TRViewModel()
    @StateObject var FPlistViewModel: FPViewModel = FPViewModel()
    @StateObject var TrivialistViewModel: TriviaViewModel = TriviaViewModel()
    
    @StateObject var LlistViewModel: LViewModel = LViewModel()
    @StateObject var FPatViewModel: FPairtableViewModel = FPairtableViewModel()
    @StateObject var TRatViewModel: TRairtableViewModel = TRairtableViewModel()
    @StateObject var FPCommentsatViewModel: FPCommentsairtableViewModel = FPCommentsairtableViewModel()
    @StateObject var Info: Information = Information()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(listViewModel)
            .environmentObject(TRlistViewModel)
            .environmentObject(FPlistViewModel)
            .environmentObject(TrivialistViewModel)
            .environmentObject(Info)
            .environmentObject(LlistViewModel)
            .environmentObject(FPatViewModel)
            .environmentObject(TRatViewModel)
            .environmentObject(FPCommentsatViewModel)
        }
    }
}
