//
//  SplashViewController.swift
//  ERP
//
//  Created by Developer on 16/02/2023.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool ?? false {
            self.pushController(controller: .home, storyboard: .main)
        } else {
            self.pushController(controller: .login, storyboard: .main)
        }
        
    }
    

}
