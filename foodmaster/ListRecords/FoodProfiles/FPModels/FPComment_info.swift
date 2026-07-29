import Foundation

struct FPCommentRecord: Hashable, Codable, Identifiable{
    var id: String = ""
    var createdTime: String = ""
    let fields: FPCommentField
}

struct FPCommentField: Hashable, Codable{
    let creatorID: String
    let comment: String
    let FPID: String
    let username: String
    let rank: String
}

struct FPCommentrecords: Hashable, Codable{
    let records: [FPCommentRecord]
}
