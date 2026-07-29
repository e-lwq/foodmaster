import SwiftUI

struct TogolistView: View {
    
    @EnvironmentObject var listViewModel: TGLViewModel
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()

                VStack{
                    HStack{
                        LRBackButton()
                    }
                    
                    HStack{
                        EditButton()
                            .font(.title3)
                            .padding(.leading)
                        Spacer()
                        NavigationLink(destination: AddView()){
                            Text("Add")
                                .font(.title3)
                                .padding(.trailing)
                                .foregroundColor(.blue)
                        }
                        
                    }
                    Text("To-Go List")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                    
                    List{
                        ForEach(listViewModel.items){item in
                            TGLItemsView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                    
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    
                    
                    .background(Image("bg_color").resizable().ignoresSafeArea())
                    
                    Text(String(listViewModel.items.count)+" in total")
                        .padding(.trailing, 20)
                        //.italic()
                        .font(.title3)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        /*HStack(alignment: .top){
                            Button{
                                Info.ress.append(["", ""])
                            }label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 30))
                            }
                            .padding(.leading, 20)
                            Spacer()
                            
                        }
                        .padding(.top)*/

                }
            }
        }.navigationBarHidden(true)
    }
}

struct TogolistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TogolistView()
        }
        .environmentObject(TGLViewModel())
    }
}


/*
Problems:
 1. when i add a new item, its data is the same as the last one instead of empty data
 2. cannot scroll (solved)
 3. idk how to delete
 4. idk how to sort the items in checked/unchecked order
 
 things to do:
 1. press tick
 */
