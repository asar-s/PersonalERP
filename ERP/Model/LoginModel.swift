//
//  LoginModel.swift
//  ERP
//
//  Created by Developer on 28/12/2022.
//

import Foundation

struct LoginModel : Codable {
    let login_token : String?
    let user : User?
    let today_sales : Double?
    let today_purchase : Int?

    enum CodingKeys: String, CodingKey {

        case login_token = "login_token"
        case user = "user"
        case today_sales = "today_sales"
        case today_purchase = "today_purchase"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login_token = try values.decodeIfPresent(String.self, forKey: .login_token)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        today_sales = try values.decodeIfPresent(Double.self, forKey: .today_sales)
        today_purchase = try values.decodeIfPresent(Int.self, forKey: .today_purchase)
    }

}
struct User : Codable {
    let first_name : String?
    let last_name : String?
    let profile_image : String?

    enum CodingKeys: String, CodingKey {

        case first_name = "first_name"
        case last_name = "last_name"
        case profile_image = "profile_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
    }

}

