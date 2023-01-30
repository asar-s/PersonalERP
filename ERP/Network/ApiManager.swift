//
//  ApiManager.swift
//  iktva
//
//  Created by evento on 15/12/2022.
//

import UIKit
import Alamofire


class APIManager {
    
    // MARK: - Vars & Lets
    
    private let sessionManager: Session
    static let networkEnviroment: NetworkEnvironment = .dev
    
    // MARK: - Vars & Lets
    
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())
        return apiManager
    }()
    
    // MARK: - Accessors
    
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
        self.sessionManager.sessionConfiguration.timeoutIntervalForRequest = 30
    }
    
    func call<T: Codable>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?)->()) {
        
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers)
//        .validate(statusCode: 200..<500)
        .responseDecodable(of: T.self) { data in
            
            print("Response for \(type.url) :", String(data: data.data ?? Data(), encoding: .utf8) ?? "")
            
            switch data.result {
            case .success(_):
                let response = try? data.result.get()
                handler(response, nil)
                break
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil, AlertMessage(title: "Oops!", body: error.localizedDescription))
                break
            }
        }
    }
    
    // MARK: - handling for the empty response from server -
    
    func call(type: EndPointType, params: Parameters? = nil, handler: @escaping (()?, _ error: AlertMessage?)->()) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers)
//        .validate(statusCode: 200..<500)
        .responseJSON { data in
            switch data.result {
            case .success(_):
                handler((), nil)
                break
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil, AlertMessage(title: "Oops!", body: error.localizedDescription))
                break
            }
        }
    }
    
    
}

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
