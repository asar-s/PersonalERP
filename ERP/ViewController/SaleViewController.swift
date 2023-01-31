//
//  SaleViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import PKHUD

class SaleViewController: UIViewController {
    
    //product Information
    @IBOutlet weak var tfSearchProduct: UITextField!
    @IBOutlet weak var tfScanQR: UITextField!
    @IBOutlet weak var tfWalkCustomer: UITextField!
    @IBOutlet weak var tfInvoice: UITextField!
    //item Information
    @IBOutlet weak var tfSearchYourPro: UITextField!
    @IBOutlet weak var tfSerial: UITextField!
    @IBOutlet weak var tfAvailQuantity: UITextField!
    @IBOutlet weak var tfSaleQuantity: UITextField!
    @IBOutlet weak var tfRate: UITextField!
    @IBOutlet weak var TfDiscount: UITextField!
    @IBOutlet weak var tfTotal: UITextField!
    //Total Information
    @IBOutlet weak var tfSaleDiscount: UITextField!
    @IBOutlet weak var tfTotalDiscount: UITextField!
    @IBOutlet weak var tfTotalTax: UITextField!
    @IBOutlet weak var tfShippingCost: UITextField!
    @IBOutlet weak var tfGrandCost: UITextField!
    @IBOutlet weak var tfPreviousCost: UITextField!
    @IBOutlet weak var tfChange: UITextField!
    @IBOutlet weak var constraintsTableHeight: NSLayoutConstraint!
    //add Walking Customer
    @IBOutlet weak var addCustomerView: UIView!
    @IBOutlet weak var tfCustomerName: UITextField!
    @IBOutlet weak var tfCustomerEmail: UITextField!
    @IBOutlet weak var tfCustomerMobile: UITextField!
    @IBOutlet weak var textView: UITextView!
    //CollectionView
    @IBOutlet weak var ListCollectionView: UICollectionView!
    @IBOutlet weak var selectionCollectionView: UICollectionView!
    @IBOutlet weak var selectionCVHeight: NSLayoutConstraint!
    
    var selectedIndex = -1
    var products = [ProductModel]()
    
    // MARK: - Variables
    var counterValue = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldRight()
        
        if let flowLayout = self.ListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSizeMake(1, 1)
        }
        
        selectionCVHeight.constant = 0
    }
    
    
    
    // MARK: - Action
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func fullPaidAction(_ sender: Any) {
    }
    
    @IBAction func addNewPurchaseAction(_ sender: Any) {
        pushController(controller: .login, storyboard: .main)
    }
    
    @IBAction func addCustomerCancelAction(_ sender: Any) {
        self.addCustomerView.fadeOut()
        
    }
    @IBAction func addCustomerSaveAction(_ sender: Any) {
        self.addCustomerView.fadeOut()
    }
    
    func setupTextFieldRight() {
        tfAvailQuantity.addLabel(lblText: "Available Quantity", textColor: UIColor.init(named: "appDarkGray") ?? UIColor.lightGray)
        tfSaleQuantity.addLabel(lblText: "Sale Quantity")
        tfRate.addLabel(lblText: "Rate")
        TfDiscount.addLabel(lblText: "Discount %")
        tfTotal.addLabel(lblText: "Total")
        tfSaleDiscount.addLabel(lblText: "Sale Discount")
        tfTotalDiscount.addLabel(lblText: "Total Discount")
        tfTotalTax.addLabel(lblText: "Total Tax")
        tfShippingCost.addLabel(lblText: "Shipping Cost")
        tfGrandCost.addLabel(lblText: "Grand Cost")
        tfPreviousCost.addLabel(lblText: "Previous Cost")
        tfChange.addLabel(lblText: "Change")
        if let imgQR = UIImage(named: "qr"), let imgAdd = UIImage (named: "add") {
            tfScanQR.addImage(direction: .Right, image: imgQR, imageFrame: CGRect(x: 10, y: 10, width: 14, height: 14))
            tfWalkCustomer.addImage(direction: .Right, image: imgAdd, imageFrame: CGRect(x: 0, y: 0, width: 35, height: 35))
        }
        tfWalkCustomer.addTapGestureRecognizer {
            self.addCustomerView.fadeIn()
        }
        tfScanQR.addTapGestureRecognizer {
            print("QR Code Pressed")
        }
    }
}

extension SaleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == ListCollectionView ? ListItem.categories.count : products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ListCollectionView  {
            let cellList = collectionView.dequeueReusableCell(withReuseIdentifier: "SaleListCollectionViewCell", for: indexPath) as! SaleListCollectionViewCell
            if indexPath.row == selectedIndex {
                cellList.configure(with: ListItem.categories[indexPath.row].name ?? "", isSelected: true)
            } else {
                cellList.configure(with: ListItem.categories[indexPath.row].name ?? "", isSelected: false)
            }
            cellList.onClick = {
                self.selectedIndex = indexPath.row
                self.ListCollectionView.reloadData()
                HUD.show(.progress)
                Service.fetchCategoryProducts(with: ListItem.categories[indexPath.row].id ?? 0) { categories, error in
                    HUD.hide()
                    if error != nil {
                        HUD.flash(.labeledError(title: nil, subtitle: error?.body ?? "Something went wrong."))
                        self.selectionCVHeight.constant = 0
                    } else if let products = categories {
                        self.products = products
                        self.selectionCollectionView.reloadData()
                        self.selectionCVHeight.constant = products.count > 0 ? 120 : 0
                    }
                }
            }
            return cellList
        } else {
            let cellSelection = collectionView.dequeueReusableCell(withReuseIdentifier: "SaleSelectionCollectionViewCell", for: indexPath) as! SaleSelectionCollectionViewCell
            cellSelection.configure(with: products[indexPath.row])
            return cellSelection
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == selectionCollectionView {
            let width = collectionView.frame.size.width
            return CGSize(width: width/3.5, height: 120)
        }
        return CGSize(width: 20, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == selectionCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! SaleSelectionCollectionViewCell
            cell.ViewQuantity.isHidden = false
            cell.lblView.backgroundColor = UIColor(named: "appBlue")
            cell.lblQuantity.text = "\(counterValue)"
            return
        }
    }
}
