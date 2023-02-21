//
//  ViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import PKHUD

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var onClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        tfEmail.text = "mariuslenovos@gmail.com"
        tfPassword.text = "Marius@1234"
    }
    
    // MARK: - IBAction
    @IBAction func LoginAction(_ sender: Any) {
        
//        setupTextField()
//        resetpassword()
        if tfEmail.text == "" || tfPassword.text == "" {
            showalert(title: "ERP", message: "Kindly enter your email and password")
        } else {
            setupLoginAPI()
//            autoLogin()
        }
    }
    
    @IBAction func showPassword(_ sender: UIButton) {
        if onClick {
            onClick = false
            self.tfPassword.isSecureTextEntry = false
        } else {
            onClick = true
            self.tfPassword.isSecureTextEntry = true
        }
    }
    
    func setupTextField() {
        if let imageEmail = UIImage(named: "email") {
            tfEmail.addImage(direction: .Right, image: imageEmail, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
//            tfPassword.addImage(direction: .Right, image: imagePassword, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
        }
    }
    
    func resetpassword(){
        HUD.show(.progress)
        Service.resetpassword(with: "derek@5m2t.com") { _, error in
            HUD.flash(.label(error?.body ?? "Something went wrong"), delay: 3)
        }
    }
    
    func setupLoginAPI() {
        guard let email = tfEmail.text?.trim() , let pass = tfPassword.text else {return}
        HUD.show(.progress)
        Service.login(with: email, and: pass) { data, error in
            if let response = data, let userData = response.data {
                HUD.flash(.success, delay: 0.5)
                LoginData.shared = userData
                self.pushController(controller: .home, storyboard: .main)
                let obj = try? PropertyListEncoder().encode(userData)
                UserDefaults.standard.setValue(obj, forKey: "UserInfo")
                let data = UserDefaults.standard.value(forKey: "UserInfo") as! Data
                let obj1 = try? PropertyListDecoder().decode(LoginData.self, from: data)
                print(obj1!)
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.synchronize()
            } else {
                HUD.flash(.labeledError(title: nil, subtitle: error?.body ?? "Somethig went wrong"), delay: 1)
            }
        }
    }
    
    func autoLogin (){
            HUD.show(.progress)
            UserDefaults.standard.set(self.tfEmail.text, forKey: "Email")
            UserDefaults.standard.set(self.tfPassword.text, forKey: "Password")
            HUD.hide()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension String {
    func trim() -> String {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}
