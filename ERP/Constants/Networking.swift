//
//  Networking.swift
//  ApiStructure
//
//  Created by Developer
//

import Foundation
import UIKit
import NVActivityIndicatorView

enum ApiEndPoints: String {
    case signIn = "login"
    case suppliers = "suppliers?search_key="
    case categories = "categories?search_key="
    case customers = "customers?search_key="
    case banks = "banks?search_key="
    case supplierProducts = "supplier/products"
    case saveCustomer = "save/customer"
    case categoryProducts = "category/products"
    case savePurchase = "save/purchase"
    case savePOS = "save/pos"
    case resetPassword = "reset/password"
}

class Networking {
    
    static let sharedInstance: Networking = Networking()
    let session = URLSession.shared
    
    public func postLoginRequest<T: Decodable>(_ apiName: String, parameters: [String:Any]? = nil, completion: @escaping(_ response: T?) -> Void) {
        //SHOW_CUSTOM_LOADER()
        let userURL = Constants.baseUrl + apiName
        let Url = String(format: userURL)
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.addValue("LK39DHEKrT@iS6w512CcwjbbSuVCHphi", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters as Any, options: []) else { return }
        request.httpBody = httpBody
        
        print("BaseUrl: ", serviceUrl)
        print("Parameters: ", parameters as Any)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            //HIDE_CUSTOM_LOADER()
            guard let jsonData = data else {
                completion(nil)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            print(String(data: jsonData, encoding: .utf8) ?? "")
            
            do {
                let decorder = JSONDecoder()
                let response = try decorder.decode(T.self, from: jsonData)
                completion(response)
            } catch (let error) {
//                print(error)
                print(error.localizedDescription)
                completion(nil)
            }
        }
        dataTask.resume()
    }
    
    public func postRequest<T: Decodable>(_ apiName: String, parameters: [String:Any]? = nil, completion: @escaping(_ response: T?) -> Void) {
        //SHOW_CUSTOM_LOADER()
        let userURL = Constants.baseUrl + apiName
        let Url = String(format: userURL)
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.addValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Constants.token, forHTTPHeaderField: "token")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters as Any, options: []) else { return }
        request.httpBody = httpBody
        
        print("BaseUrl: ", serviceUrl)
        print("Parameters: ", parameters as Any)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            //HIDE_CUSTOM_LOADER()
            guard let jsonData = data else {
                completion(nil)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            print(String(data: jsonData, encoding: .utf8) ?? "")
            
            do {
                let decorder = JSONDecoder()
                let response = try decorder.decode(T.self, from: jsonData)
                completion(response)
            } catch (let error) {
//                print(error)
                print(error.localizedDescription)
                completion(nil)
            }
        }
        dataTask.resume()
    }
    
    
    
    
    public func getRequest<T: Decodable>(_ apiName: String, parameters: [String:Any]? = nil, completion: @escaping(_ response: T?) -> Void) {
        //SHOW_CUSTOM_LOADER()
        
        let userURL = Constants.baseUrl + apiName
        
        let Url = String(format: userURL)
        guard let serviceUrl = URL(string: Url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.addValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        request.addValue(Constants.token, forHTTPHeaderField: "token")
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            //HIDE_CUSTOM_LOADER()
            guard let jsonData = data else {
                completion(nil)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            print(String(data: jsonData, encoding: .utf8) ?? "")
            
            do {
                let decorder = JSONDecoder()
                let response = try decorder.decode(T.self, from: jsonData)
                completion(response)
            } catch (let error) {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        dataTask.resume()
    }
}
