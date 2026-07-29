import Foundation

struct TRRecord: Hashable, Codable, Identifiable{
    var id: String = ""
    var createdTime: String = ""
    let fields: TRField
}

struct TRField: Hashable, Codable{
    let TRID: String
    let title: String
    let address: String
    let emoji_ind: Int
    let em: Int
    let notes: String
    let likes: Int
    let creatorID: String
}

struct TRrecords: Hashable, Codable{
    let records: [TRRecord]
}
