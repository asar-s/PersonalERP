//
//  SaleCollectionViewCell.swift
//  ERP
//
//  Created by Developer on 22/12/2022.
//

import UIKit

class SaleListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblList: UILabel!
    @IBOutlet weak var btnList: UIButton!
    
    func configure(with name: String) {
        self.lblList.preferredMaxLayoutWidth = 50
        self.lblList.text = name
    }
    
    @IBAction func ListAction(_ sender: Any) {
    }
}
