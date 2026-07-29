import Foundation

class TGLViewModel: ObservableObject{
    
    @Published var items: [TGL_info] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems:[TGL_info] = []
            /*TGL_info(title: "Go to place a", address: "address a", completed: true),
            TGL_info(title: "Go to place b", address: "address b", completed: false),
            TGL_info(title: "Go to place c", address: "address c", completed: true),
            TGL_info(title: "Go to place d", address: "address d", completed: false)*/
        //]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, address: String){
        let newItem=TGL_info(title: title, address: address, completed: false)
        items.append(newItem)
    }
    
    func updateItem(item: TGL_info){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            //items[index].completed = !items[index].completed
            items[index] = item.updateComplete()
        }
    }
    
}
