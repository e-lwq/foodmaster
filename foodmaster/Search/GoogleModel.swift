import Foundation

struct GoogleModel: Identifiable {
    let id = UUID()
    let title: [String?]
    let description: [String?]
    let link: [String?]
}

struct SearchItemInfo{
    var allItems: [GoogleModel]
}

/*struct GoogleImage: Identifiable{
    let id = UUID()
    let image: [String?]
}

struct ImageData{
    var allImages: [GoogleImage]
}*/
