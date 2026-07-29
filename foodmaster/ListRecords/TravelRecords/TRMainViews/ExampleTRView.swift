import SwiftUI

struct ExampleTRView: View {
    
    var ExampleTRs = ExampleTR()
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    TRBackButton(ind: 0)
                    
                    Text("Example Travel Records")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    
                    List{
                        ForEach(ExampleTRs.TRitems){item in
                            NavigationLink(destination: OtherTRAddView(item: item)){
                                TRItemsView(item: item)
                            }
                        }
                    }.padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ExampleTRView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ExampleTRView()
        }
    }
}
