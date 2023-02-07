//
//  PurchaseViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import iOSDropDown

class PurchaseViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tfSupplier: DropDown!
    @IBOutlet weak var tfInvoice: UITextField!
    @IBOutlet weak var tfPaymentType: DropDown!
    @IBOutlet weak var tfBank: DropDown!
    @IBOutlet weak var constraintsBankHeight: NSLayoutConstraint!
    @IBOutlet weak var tfPurchaseDate: UITextField!
    @IBOutlet weak var tfDetails: UITextField!
    //item Information
    @IBOutlet weak var tfProductName: DropDown!
    @IBOutlet weak var tfStock: UITextField!
    @IBOutlet weak var tfQuantity: UITextField!
    @IBOutlet weak var tfRate: UITextField!
    //total
    @IBOutlet weak var tfTotal: UITextField!
    @IBOutlet weak var tfDiscount: UITextField!
    @IBOutlet weak var tfGrandTotal: UITextField!
    @IBOutlet weak var tfPaidAmount: UITextField!
    @IBOutlet weak var tfDueAmount: UITextField!
    
    // MARK: - Variables
    var viewModel = [SuppliersModel]()
    let myData = ["AAA", "BBB", "CCC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDown()
       // setupAPI()
    }
    
    func setupDropDown() {
//          setupAPI()
        
        updateDropdown(tfSupplier, dropdownData: myData) {  text, index, id in
            
        }
        updateDropdown(tfPaymentType, dropdownData: myData) { text, index, id in
            
        }
        updateDropdown(tfBank, dropdownData: myData) { text, index, id in
            
        }
        updateDropdown(tfProductName, dropdownData: myData) { text, index, id in
            
        }
        
    }
    func setupTextField() {
        textFieldAlert(tfSupplier); textFieldAlert(tfInvoice); textFieldAlert(tfPaymentType); textFieldAlert(tfPurchaseDate); textFieldAlert(tfProductName); textFieldAlert(tfStock); textFieldAlert(tfQuantity); textFieldAlert(tfRate)
    }
    
//    func setupAPI() {
//
//        APIService.suuppliersAPI() { data in
//            self.viewModel = data
//
//        }
//
//
//    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func fullPaidAction(_ sender: Any) {
    }
    
    @IBAction func addPurchaseAction(_ sender: Any) {
        setupTextField()
        pushController(controller: .login, storyboard: .main)
    }
}
