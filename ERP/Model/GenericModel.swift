//
//  GenericModel.swift
//  SCLPT
//
//  Created by Developer
//

import Foundation

struct GenericModel <T: Decodable> : Decodable {
    let status : Int?
    let message: String?
    let data : T?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(T.self, forKey: .data)
    }
}



struct GenericModelWithArray <T: Decodable> : Decodable {
    let status : Int?
    let message: String?
    let data : [T]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([T].self, forKey: .data)
    }
}
