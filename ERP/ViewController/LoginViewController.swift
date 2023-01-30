//
//  ViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import PKHUD

class LoginViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = "jahanzaib@eliteapps.com.pk"
        let pass = "12345678"
        tfEmail.text = email
        tfPassword.text = pass
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func LoginAction(_ sender: Any) {
        setupTextField()
    }
    
    func setupTextField() {
        if let imageEmail = UIImage(named: "email"), let imagePassword = UIImage (named: "password") {
            tfEmail.addImage(direction: .Right, image: imageEmail, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
            tfPassword.addImage(direction: .Right, image: imagePassword, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
        }
        textFieldAlert(tfEmail)
        textFieldAlert(tfPassword)
        setupLoginAPI()
    }
    
    func setupLoginAPI() {
        guard let email = tfEmail.text?.trim() , let pass = tfPassword.text else {return}
        HUD.show(.progress)
        Service.login(with: email, and: pass) { data, error in
            if let response = data, let userData = response.data {
                HUD.flash(.success, delay: 0.5)
                LoginData.shared = userData
                self.pushController(controller: .home, storyboard: .main)
            } else {
                HUD.flash(.labeledError(title: nil, subtitle: error?.body ?? "Somethig went wrong"), delay: 1)
            }
        }
    }
}

extension String {
    func trim() -> String {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}
