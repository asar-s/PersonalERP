//
//  HomeViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var lblPurchase: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Action
    @IBAction func addSalesAction(_ sender: Any) {
        pushController(controller: .addSale, storyboard: .main)
    }
    
    @IBAction func addPurchaseAction(_ sender: Any) {
        pushController(controller: .addPurshase, storyboard: .main)
    }
    
    @IBAction func sideMenuAction(_ sender: Any) {
    }
    // MARK: - Navigation
}
