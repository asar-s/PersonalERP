//
//  SaleProductSelectionCollectionViewCell.swift
//  ERP
//
//  Created by Developer on 22/12/2022.
//

import UIKit
import Kingfisher

class SaleSelectionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblView: UIView!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var ViewQuantity: UIView!
    @IBOutlet weak var lblQuantity: UILabel!
    
    
    func configure(with model: ProductModel) {
        let url = URL(string: model.image ?? "")
        imgProduct.kf.setImage(with: url)
        lblProduct.text = "\(model.name ?? "")"
    }
    
}
