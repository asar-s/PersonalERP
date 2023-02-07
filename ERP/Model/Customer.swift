//
//  Customer.swift
//  ERP
//
//  Created by Muhammad Asar on 07/02/2023.
//

import Foundation

struct Customer : Codable {

    static var customers: [Customer] = {
        return [Customer]()
    }()
    
    let id : Int?
    let name : String?
    let previousDueAmount : Double?


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case previousDueAmount = "previous_due_amount"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        previousDueAmount = try values.decodeIfPresent(Double.self, forKey: .previousDueAmount)
    }


}
