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
    
//    static func search(with search: String, handler: @escaping (_ user: [User]?, _ error: AlertMessage?)->()) {
//        let params = ["search": search,
//                      "id": User.decoded()?.id ?? 0] as? [String: Any]
//        APIManager.shared().call(type: EndpointItem.search, params: params) { (response: BaseResponse<[User]>?, message: AlertMessage?) in
//            if let response = response {
//                if response.isThereApiError() {
//                    handler(nil, AlertMessage(title: "Oops!", body: response.message ?? "Something went wrong"))
//                    return
//                } else {
//                    handler(response.response, nil)
//                }
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//    
//    static func fetchNotifications(handler: @escaping (_ user: [NotificationsModel]?, _ error: AlertMessage?)->()) {
//        let params = ["id": User.decoded()?.id ?? 0] as? [String: Any]
//        APIManager.shared().call(type: EndpointItem.notifications, params: params) { (response: BaseResponse<[NotificationsModel]>?, message: AlertMessage?) in
//            if let response = response {
//                if response.isThereApiError() {
//                    handler(nil, AlertMessage(title: "Oops!", body: response.message ?? "Something went wrong"))
//                    return
//                } else {
//                    handler(response.response, nil)
//                }
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//    
//    static func friendRequest(type: ConnectionStatus, to userId: Int, handler: @escaping (_ success: Bool, _ error: AlertMessage?)->()) {
//        let params = ["UserId":  User.decoded()?.id ?? 0,
//                      "FriendId": userId,
//                      "Status": type.rawValue] as? [String: Any]
//        APIManager.shared().call(type: EndpointItem.connectionRequest, params: params) { (response: BaseResponse<[User]>?, message: AlertMessage?) in
//            if let response = response {
//                if response.isThereApiError() {
//                    handler(response.success ?? false, AlertMessage(title: "Oops!", body: response.message ?? "Something went wrong"))
//                    return
//                } else {
//                    handler(response.success ?? false, nil)
//                }
//            } else {
//                handler(response?.success ?? false, message!)
//            }
//        }
//    }
//    
//    static func fetchConnections(for type: ConnectionStatus, handler: @escaping (_ user: [User]?, _ error: AlertMessage?)->()) {
//        let params = ["id": User.decoded()?.id ?? 0,
//                      "Status": type.rawValue] as? [String: Any]
//        APIManager.shared().call(type: EndpointItem.getConnections, params: params) { (response: BaseResponse<[User]>?, message: AlertMessage?) in
//            if let response = response {
//                if response.isThereApiError() {
//                    handler(nil, AlertMessage(title: "Oops!", body: response.message ?? "Something went wrong"))
//                    return
//                } else {
//                    handler(response.response, nil)
//                }
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//    
//    static func getAppSettings(handler: @escaping (_ settings: AppSetting?, _ error: AlertMessage?)->()) {
//        APIManager.shared().call(type: EndpointItem.appsettings) { (response: BaseResponse<AppSetting>?, message: AlertMessage?) in
//            if let response = response {
//                if response.isThereApiError() {
//                    handler(nil, AlertMessage(title: "Oops!", body: response.message ?? "Something went wrong"))
//                    return
//                } else {
//                    handler(response.response, nil)
//                }
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//     
//    static func getLocations(handler: @escaping (_ locations: [ARLocation]?, _ error: AlertMessage?)->()) {
//        APIManager.shared().call(type: EndpointItem.getLocations) { (response: BaseResponse<[ARLocation]>?, message: AlertMessage?) in
//            if let response = response {
//                if response.isThereApiError() {
//                    handler(nil, AlertMessage(title: "Oops!", body: response.message ?? "Something went wrong"))
//                    return
//                } else {
//                    handler(response.response, nil)
//                }
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//    
//    static func fetchEvents(for type: EventType, handler: @escaping (_ events: [Event]?, _ error: AlertMessage?)->()) {
//        var params = [String: Any]()
//        
//        if User.isLoggedIn {
//            params = ["slug": type.rawValue,
//                      "user_email": User.decoded()?.email ?? ""]
//        } else {
//            params = ["slug": type.rawValue]
//        }
//        
//        let endPoint: EndpointItem = User.isLoggedIn ? .userEvents : .getEvents
//        
//        APIManager.shared().call(type: endPoint, params: params) { (response: BaseResponseForEvents<[Event]>?, message: AlertMessage?) in
//            if let response = response {
//                handler(response.response, nil)
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//    
//    static func bookmarkEvent(_ post: Int, handler: @escaping (_ response: BookmarkEvent?, _ error: AlertMessage?)->()) {
//        let params = ["post_id": post,
//                      "bookmark_note": "abc",
//                      "email":User.decoded()?.email ?? ""] as? [String: Any]
//        
//        APIManager.shared().call(type: EndpointItem.bookmarkEvent, params: params) { (response: BookmarkEvent?, message: AlertMessage?) in
//            if let response = response {
//                handler(response, nil)
//            } else {
//                handler(nil, message!)
//            }
//        }
//    }
//    
//    static func attendEvent(_ eventId: Int, status: String, handler: @escaping (_ response: AttendEvent?, _ error: AlertMessage?)->()) {
//        let params = ["post_title": "\(User.decoded()?.id ?? 0)\(eventId)",
//                      "attendee_email": User.decoded()?.email ?? "",
//                      "post_parent": eventId,
//                      "post_status": status,
//                      "event_registration_note":"test"] as? [String: Any]
//        
//        APIManager.shared().call(type: EndpointItem.attendEvent, params: params) { (response: AttendEvent?, message: AlertMessage?) in
//            if let response = response {
//                handler(response, nil)
//            } else {
//                handler(nil, AlertMessage(title: "Oops.", body: "Something went wrong."))
//            }
//        }
//    }
}
