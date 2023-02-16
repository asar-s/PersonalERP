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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let email = "jahanzaib@eliteapps.com.pk"
//        let pass = "12345678"
//        tfEmail.text = email
//        tfPassword.text = pass
    }
    
    // MARK: - IBAction
    @IBAction func LoginAction(_ sender: Any) {
//        setupTextField()
//        resetpassword()
        self.pushController(controller: .home, storyboard: .main)
    }
    
    func setupTextField() {
        if let imageEmail = UIImage(named: "email"), let imagePassword = UIImage (named: "password") {
            tfEmail.addImage(direction: .Right, image: imageEmail, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
            tfPassword.addImage(direction: .Right, image: imagePassword, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
        }
        
        if tfEmail.text == "" || tfPassword.text == "" {
            showalert(title: "ERP", message: "Kindly enter your email and password")
        } else {
            setupLoginAPI()
            autoLogin()
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
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.synchronize()
            } else {
                HUD.flash(.labeledError(title: nil, subtitle: error?.body ?? "Somethig went wrong"), delay: 1)
            }
        }
    }
    
    func autoLogin (){
        let alert = UIAlertController(title: "Auto Saving", message: "Do You Want to Save Login Details", preferredStyle: .alert)
        let yesbtn = UIAlertAction(title: "Yes", style: .default) { (action) in
            HUD.show(.progress)
            UserDefaults.standard.set(self.tfEmail.text, forKey: "Email")
            UserDefaults.standard.set(self.tfPassword.text, forKey: "Password")
            HUD.hide()
            self.pushController(controller: .home, storyboard: .main)
        }
        let nobtn = UIAlertAction(title: "No", style: .destructive) { (action) in
            self.pushController(controller: .home, storyboard: .main)
        }
        alert.addAction(yesbtn)
        alert.addAction(nobtn)
        present(alert, animated: true, completion: nil)
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
