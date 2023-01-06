//
//  ViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = "mariuslenovos@gmail.com".trim()
        let pass = "Marius@1234".trim()
        tfEmail.text = email
        tfPassword.text = pass
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func LoginAction(_ sender: Any) {
        setupTextField()
        pushController(controller: .home, storyboard: .main)
    }
    
    func setupTextField() {
        if let imageEmail = UIImage(named: "email"), let imagePassword = UIImage (named: "password") {
            tfEmail.addImage(direction: .Right, image: imageEmail, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
            tfPassword.addImage(direction: .Right, image: imagePassword, imageFrame: CGRect(x: 5, y: 10, width: 15, height: 15))
        }
        textFieldAlert(tfEmail); textFieldAlert(tfPassword)
        setupLoginAPI()
    }
    
    func setupLoginAPI() {
        guard let email = tfEmail.text , let pass = tfPassword.text else {return}
        APIService.loginAPI(email: email, password: pass)
    }
}

extension String {
    func trim() -> String {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}
