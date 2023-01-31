//
//  SaleCollectionViewCell.swift
//  ERP
//
//  Created by Developer on 22/12/2022.
//

import UIKit

class SaleListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblList: UILabel!
    @IBOutlet weak var btnList: UIButton!
    
    var onClick: (()->())?
    
    func configure(with name: String, isSelected: Bool = false) {
        containerView.backgroundColor = isSelected ? UIColor(named: "appBlue") : UIColor(named: "appText")
        self.lblList.preferredMaxLayoutWidth = 50
        self.lblList.text = name
    }
    
    @IBAction func ListAction(_ sender: Any) {
        onClick?()
    }
}
