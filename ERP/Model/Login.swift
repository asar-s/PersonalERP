// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Int?
    let data: DataClasss?
}

// MARK: - DataClass
struct DataClasss: Codable {
    let loginToken: String?
    let user: Users?
    let todaySales: Double?
    let todayPurchase: Int?

    enum CodingKeys: String, CodingKey {
        case loginToken = "login_token"
        case user
        case todaySales = "today_sales"
        case todayPurchase = "today_purchase"
    }
}

// MARK: - User
struct Users: Codable {
    let firstName, lastName, profileImage: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
    }
}
