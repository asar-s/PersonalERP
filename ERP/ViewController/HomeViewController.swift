//
//  HomeViewController.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import PKHUD

class HomeViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var lblPurchase: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchStaticData()
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
    
    func fetchStaticData() {
        
        HUD.show(.progress)
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.fetchCategories { categories, error in
            dispatchGroup.leave()
            if error == nil, let cats = categories {
                ListItem.categories = cats
            }
        }
        dispatchGroup.enter()
        Service.fetchSupliers { supliers, error in
            dispatchGroup.leave()
            if error == nil, let sups = supliers {
                ListItem.supliers = sups
            }
        }
        dispatchGroup.enter()
        Service.fetchCustomers(handler: { customers, error in
            dispatchGroup.leave()
            if error == nil, let custs = customers {
                Customer.customers = custs
            }
        })
        
        dispatchGroup.enter()
        Service.bank { banks, error in
            dispatchGroup.leave()
            if error == nil, let baks = banks {
                ListItemForBank.banks = baks
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            HUD.hide()
        }
    }
}
