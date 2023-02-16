//
//  Services.swift
//  iktva
//
//  Created by evento on 01/01/2023.
//

import UIKit

struct Service {
    
    static func login(with email: String, and password: String, handler: @escaping (_ data: BaseResponse<LoginData>?, _ error: AlertMessage?)->()) {
        let params = ["email": email,
                      "password": password] as? [String: Any]
        APIManager.shared().call(type: EndpointItem.login, params: params) { (response: BaseResponse<LoginData>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func fetchCategories(with search: String = "", handler: @escaping (_ categories: [ListItem]?, _ error: AlertMessage?)->()) {
        var params: [String: Any] = [:]
        if search != "" {
            params = ["search_key": search] as [String: Any]
        }
        APIManager.shared().call(type: EndpointItem.categories, params: params) { (response: BaseResponse<[ListItem]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func fetchSupliers(with search: String = "", handler: @escaping (_ supliers: [ListItem]?, _ error: AlertMessage?)->()) {
        var params: [String: Any] = [:]
        if search != "" {
            params = ["search_key": search] as [String: Any]
        }
        APIManager.shared().call(type: EndpointItem.suppliers, params: params) { (response: BaseResponse<[ListItem]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func fetchCategoryProducts(with id: Int, handler: @escaping (_ categories: [ProductModel]?, _ error: AlertMessage?)->()) {
        let params = ["category_id": id] as [String: Any]
        APIManager.shared().call(type: EndpointItem.categoryProducts, params: params) { (response: BaseResponse<[ProductModel]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func fetchSuplierProducts(with id: Int, handler: @escaping (_ supliers: [ProductModel]?, _ error: AlertMessage?)->()) {
        let params = ["supplier_id": id] as [String: Any]
        APIManager.shared().call(type: EndpointItem.supplierProducts, params: params) { (response: BaseResponse<[ProductModel]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func fetchCustomers(with name: String = "", handler: @escaping (_ customers: [Customer]?, _ error: AlertMessage?)->()) {
        let params = ["search_key": name] as [String: Any]
        APIManager.shared().call(type: EndpointItem.customers, params: params) { (response: BaseResponse<[Customer]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func savePOS(with params: [String: Any], handler: @escaping (_ message: BaseResponse<EmptyResponse>?, _ error: AlertMessage?)->()) {
        APIManager.shared().call(type: EndpointItem.savePOS, params: params) { (response: BaseResponse<[EmptyResponse]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(nil, AlertMessage(title: "ERP", body: response.message ?? "Something went wrong"))
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func resetpassword(with email: String, handler: @escaping (_ message: BaseResponse<EmptyResponse>?, _ error: AlertMessage?)->()) {
        let params = ["email": email] as? [String: Any]
        APIManager.shared().call(type: EndpointItem.resetPassword, params: params) { (response: BaseResponse<EmptyResponse>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(nil, AlertMessage(title: "Password Reset", body: response.message ?? "Something went wrong"))
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func savePurchase(with params: [String: Any], handler: @escaping (_ message: BaseResponse<EmptyResponse>?, _ error: AlertMessage?)->()) {
        
        APIManager.shared().call(type: EndpointItem.savePurchase, params: params) { (response: BaseResponse<[EmptyResponse]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(nil, AlertMessage(title: "ERP", body: response.message ?? "Something went wrong"))
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func bank(with search: String = "", handler: @escaping (_ banks: [ListItemForBank]?, _ error: AlertMessage?)->()) {
        var params: [String: Any] = [:]
        if search != "" {
            params = ["search_key": search] as [String: Any]
        }
        APIManager.shared().call(type: EndpointItem.banks, params: params) { (response: BaseResponse<[ListItemForBank]>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
    static func saveCustomer(with params: [String: Any], handler: @escaping (_ customer: ListItem?, _ error: AlertMessage?)->()) {
        APIManager.shared().call(type: EndpointItem.saveCustomer, params: params) { (response: BaseResponse<ListItem>?, message: AlertMessage?) in
            if let response = response {
                if response.status != 200 {
                    handler(nil, AlertMessage(title: "Oops!", body: response.error ?? "Something went wrong"))
                    return
                } else {
                    handler(response.data, nil)
                }
            } else {
                handler(nil, message!)
            }
        }
    }
    
}
