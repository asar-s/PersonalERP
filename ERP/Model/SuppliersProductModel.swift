//
//  SuppliersProductModel.swift
//  ERP
//
//  Created by Developer on 29/12/2022.
//

import Foundation

struct SuppliersProductModel : Codable {
    let id : String?
    let name : String?
    let price : Int?
    let serial_no : String?
    let stock : Int?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case price = "price"
        case serial_no = "serial_no"
        case stock = "stock"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        serial_no = try values.decodeIfPresent(String.self, forKey: .serial_no)
        stock = try values.decodeIfPresent(Int.self, forKey: .stock)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
