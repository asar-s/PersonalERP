//
//  UIView.swift
//  ERP
//
//  Created by Developer on 21/12/2022.
//

import UIKit
import iOSDropDown

extension UIView {
    
    @IBInspectable var makeCircle: Bool {
        get {
            return self.layer.cornerRadius > 0
        }
        set {
            if newValue == true {
                self.layer.cornerRadius = self.layer.frame.height / 2
            }
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.lightGray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0),
                   shadowOpacity: Float = 1,
                   shadowRadius: CGFloat = 2.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
}

@IBDesignable
extension UITextField {
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}

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
    
    func addLabel(direction: Direction = .Right, lblText: String, textColor: UIColor = UIColor.init(named: "appBlue") ?? UIColor.blue){
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

extension UIViewController {
    
    enum Storyboard: String {
        case main = "Main"
    }
    enum Controller: String {
        case login = "LoginViewController"
        case home = "HomeViewController"
        case addPurshase = "PurchaseViewController"
        case addSale = "SaleViewController"
    }
    
    func pushController(controller toPush: Controller , storyboard: Storyboard) {
        let controller = UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: toPush.rawValue)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showalert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateDropdown(_ dropdown: DropDown, dropdownData: [String]) {
        dropdown.optionArray = dropdownData
        dropdown.checkMarkEnabled = false
        dropdown.isSearchEnable = false
        dropdown.arrowSize = 10
        dropdown.arrowColor = UIColor(named: "appLighGray") ?? UIColor.darkGray
        dropdown.selectedRowColor = UIColor(named: "appLighGray") ?? UIColor.lightGray
        
    }
    func textFieldAlert (_ textfield: UITextField) {
        let textfield = textfield.text
        if textfield?.isEmpty == true {
            showalert(message: "Empty Field")
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(passwrd: String) -> Bool {
        let passwordRegex = "(?=[^A-Za-z][A-Za-z])(?=[^0-9][0-9])[A-Za-z0-9]{8,50}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: passwrd)
    }
}

extension UIView {

    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }

    fileprivate typealias Action = (() -> Void)?


    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }


    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }


    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }

}

extension UIView {

func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
   self.alpha = 0.0

   UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
       self.isHidden = false
       self.alpha = 1.0
   }, completion: completion)
}

func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
   self.alpha = 1.0

   UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
       self.alpha = 0.0
   }) { (completed) in
       self.isHidden = true
       completion(true)
   }
 }
}
