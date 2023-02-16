//
//  PurchaseViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import iOSDropDown 
import PKHUD

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
    
    var selectedProduct : ProductModel?
    var selectedSuplier : ListItem?
    var selectedBank : ListItemForBank?
    var selectedPaymentTypeID: Int?
    let paymentTypes: [(id: Int, name: String)] = [(id: 1, name: "Cash"), (id: 2, name: "Bank")]
    let datepikker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDown()
        creatdatepikker()
       // setupAPI()
        
    }
    
    func setupDropDown() {
//          setupAPI()
        
        updateDropdown(tfSupplier, dropdownData: ListItem.supliers.compactMap { $0.name }) { text, index, id in
            self.selectedSuplier = ListItem.supliers[index]
            self.fetchSuplierProducts()
        }

        updateDropdown(tfPaymentType, dropdownData: paymentTypes.compactMap { $0.name }) { text, index, id in
            self.selectedPaymentTypeID = index
        }
        updateDropdown(tfBank, dropdownData: ListItemForBank.banks.compactMap { $0.name }) { text, index, id in
            self.selectedBank = ListItemForBank.banks[index]
        }
        
    }
//    func setupTextField() {
//        textFieldAlert(tfSupplier); textFieldAlert(tfInvoice); textFieldAlert(tfPaymentType); textFieldAlert(tfPurchaseDate); textFieldAlert(tfProductName); textFieldAlert(tfStock); textFieldAlert(tfQuantity); textFieldAlert(tfRate)
//    }
    
//    func setupAPI() {
//
//        APIService.suuppliersAPI() { data in
//            self.viewModel = data
//
//        }
//
//
//    }
    func savePurchase(){
        HUD.show(.progress)
        let param = ["supplier_id" : selectedSuplier?.id ?? 0,
                     "invoice_no" : tfInvoice.text ?? "",
                     "payment_type" : selectedPaymentTypeID ?? 0,
                     "bank_id" : selectedBank?.id ?? 0,
                     "product_id" : selectedProduct?.id ?? 0,
                     "quantity" : tfQuantity.text ?? "",
                     "price" : tfRate.text ?? "",
                     "discount" : tfDiscount.text ?? "",
                     "paid_amount" : tfPaidAmount.text ?? "",
                     "description" : tfDetails.text ?? "",
                     "purchase_date" : tfPurchaseDate.text ?? ""] as [String : Any]
        Service.savePurchase(with: param) { message, error in
            HUD.flash(.label(error?.body ?? "Something went wrong"), delay: 3)
        }
    }
    
    func fetchSuplierProducts (){
        if let id = self.selectedSuplier?.id {
            HUD.show(.progress)
            Service.fetchSuplierProducts(with: id) { supliers, error in
                HUD.hide()
                if let sups = supliers {
                    self.updateDropdown(self.tfProductName, dropdownData: sups.compactMap { $0.name } ) { text, index, id in
                        self.selectedProduct = sups[index]
                    }
                }
            }
        }
    }
    
    func creatdatepikker (){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        toolbar.setItems([donebtn], animated: true)
        tfPurchaseDate.inputAccessoryView = toolbar
        tfPurchaseDate.inputView = datepikker
        if #available(iOS 13.4, *) {
            datepikker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datepikker.datePickerMode = .date
        let dateString = "\(datepikker.date)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date =  dateFormatter.date(from: dateString)
    }
    
    @objc func donepressed(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        tfPurchaseDate.text = formatter.string(from: datepikker.date)
        self.view.endEditing(true)
    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func fullPaidAction(_ sender: Any) {
    }
    
    @IBAction func addPurchaseAction(_ sender: Any) {
        savePurchase()
//        setupTextField()
        pushController(controller: .login, storyboard: .main)
    }
}
