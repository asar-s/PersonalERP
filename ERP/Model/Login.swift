// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - DataClass
struct LoginData: Codable {
    
    static var shared: LoginData = {
        return LoginData()
    }()
    
    let loginToken: String?
    let user: UserData?
    let todaySales: Double?
    let todayPurchase: Int?

    enum CodingKeys: String, CodingKey {
        case loginToken = "login_token"
        case user
        case todaySales = "today_sales"
        case todayPurchase = "today_purchase"
    }
    
    init() {
        self.loginToken = ""
        self.user = UserData()
        self.todaySales = 0
        self.todayPurchase = 0
    }
    
}

// MARK: - User
struct UserData: Codable {
    
    let firstName, lastName, profileImage: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
    }
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.profileImage = ""
    }
}
