// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct BaseResponse<T: Codable>: Codable {
    
    let data : T?
    let status : Int?
    let error : String?

    enum CodingKeys: String, CodingKey {
        case data
        case error
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        error = try values.decodeIfPresent(String.self, forKey: .error)
        data = try values.decodeIfPresent(T.self, forKey: .data)
    }

}

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
