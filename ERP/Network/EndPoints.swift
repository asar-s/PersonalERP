//
//  EndPoints.swift
//  iktva
//
//  Created by evento on 15/12/2022.
//

import Alamofire

enum NetworkEnvironment {
    case dev
    case production
    case stage
}

protocol EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    
}

enum EndpointItem {
    
    // MARK: User actions
    
    case login
    case suppliers
    case categories
    case customers
    case banks
    case supplierProducts
    case saveCustomer
    case categoryProducts
    case savePurchase
    case savePOS
    case resetPassword
    
    case userExists(_: String)

}

// MARK: - Extensions
// MARK: - EndPointType
extension EndpointItem: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
        case .dev: return "https://roomely.pw/api/"
        case .production: return ""
        case .stage: return ""
        }
    }
    
    var apiKey: String { "LK39DHEKrT@iS6w512CcwjbbSuVCHphi" }
    
    var token: String { "eyJpdiI6IjZXd3hUa0t6a010OGI5cnp5QlpPS3c9PSIsInZhbHVlIjoiRWZpU2dnMGRyNk4zazhIbVdqczRVV1JtVHFDSDBGaU1JMDIxRWVNOEgxT0UybGx4N1wveG40Nk44K3BVbW1GR3dJZlplNDkwbmdUd3hEblpQZ3VtUGJoK2hMQW96dXhaeTRudEo2MDNIaTd5QWVnU1NJWGhJVjVWNHpkdWZUa1B1ZmtiVXdJcE53SThEWDVOVTJnaXJJS0VsZ0cxV3NjdHJMYWRKNXM0c1JGV1hmcDBacXdQT2JpN3FEdENncW10TEVEXC9mckF5KzhtR2F5SlNOaXorQzhcL2hDNGNmeVF0SWE2bGtDeEw0Q0FSQT0iLCJtYWMiOiIxNzBlODk5MTg2MTUxMzljMGQ5MjMxNzhiN2ZjNzg5YWYyNjMyMDJiMzRkN2Y2NjkzOWMzOWI1MjllMWI5M2YwIn0=" }
    
    var version: String {
        return "/v0_1"
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .suppliers:
            return "suppliers"
        case .customers:
            return "customers"
        case .banks:
            return "banks"
        case .supplierProducts:
            return "supplier/products"
        case .categories:
            return "categories"
        case .saveCustomer:
            return "save/customer"
        case .categoryProducts:
            return "category/products"
        case .savePurchase:
            return "save/purchase"
        case .savePOS:
            return "save/pos"
        case .resetPassword:
            return "reset/password"
        case .userExists(let email):
            return "/user/check/\(email)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .suppliers, .categories, .customers, .banks:
            return .get
        default:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return ["x-api-key": "\(self.apiKey)"]
        case .suppliers, .categories, .supplierProducts, .categoryProducts, .customers, .resetPassword, .savePurchase, .savePOS, .banks, .saveCustomer:
            return ["x-api-key": "\(self.apiKey)",
                    "token": "\(self.token)"]
        case .userExists:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest",
                    "x-access-token": "someToken"]
//        default:
//            return ["Content-Type": "application/json"]
//                    ,
//                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        case .userExists(let email):
            print(email)
            return URL(string: self.path)!
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
}
