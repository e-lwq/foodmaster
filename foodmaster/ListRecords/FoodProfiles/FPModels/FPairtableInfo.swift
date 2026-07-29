import Foundation

struct FPRecord: Hashable, Codable, Identifiable{
    var id: String = ""
    var createdTime: String = ""
    let fields: FPField
}

struct FPField: Hashable, Codable{
    let FPID: String
    let foodname: String
    let origin: String
    let places: String
    let notes: String
    let likes: Int
    let creatorID: String
}

struct FPrecords: Hashable, Codable{
    let records: [FPRecord]
}
