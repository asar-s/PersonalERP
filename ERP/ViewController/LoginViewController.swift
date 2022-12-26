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
    }
}

