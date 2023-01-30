//
//  ErrorObject.swift
//  iktva
//
//  Created by evento on 20/12/2022.
//

import UIKit

struct AlertMessage {
    
    var title = "Oops!"
    var body = "Something went wrong."
    
}

class ErrorObject: Codable {
    
    let message: String
    let key: String?
    
}
