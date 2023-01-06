//
//  UITextFieldExtension.swift
//  ERP
//
//  Created by Developer on 28/12/2022.
//

import Foundation
import UIKit

extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
    // add image to textfield
    func addImage(direction: Direction, image: UIImage, imageFrame: CGRect){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = imageFrame
        view.addSubview(imageView)
        
        if(Direction.Left == direction){ // image left
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            self.rightViewMode = .always
            self.rightView = mainView
        }
    }
    
    func addLabel(direction: Direction = .Right, lblText: String, textColor: UIColor = UIColor.init(named: "appBlue") ?? UIColor.blue) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        mainView.addSubview(view)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        label.text = lblText
        label.font = UIFont.init(name: "Montserrat-Regular", size: 10)
        label.textColor = textColor
        label.backgroundColor = .clear
        label.textAlignment = .center
        view.addSubview(label)
        
        if(Direction.Left == direction){
            self.leftViewMode = .always
            self.leftView = mainView
        } else {
            self.rightViewMode = .always
            self.rightView = mainView
        }
    }
}

