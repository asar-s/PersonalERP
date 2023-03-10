//
//  ListItem.swift
//  ERP
//
//  Created by Muhammad Asar on 31/01/2023.
//

import UIKit

struct ListItem : Codable {
    
    static var categories: [ListItem] = {
        return [ListItem]()
    }()
    
    static var supliers: [ListItem] = {
        return [ListItem]()
    }()
    
    let id : Int?
    let name : String?
    
    var isSelected = false

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct ListItemForBank : Codable {
    static var banks : [ListItemForBank] = {
        return [ListItemForBank]()
    }()
    
    let id : String?
    let name : String?
    
    var isSelected = false

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

