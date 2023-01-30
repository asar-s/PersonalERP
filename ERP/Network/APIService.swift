//
//  OnboardingService.swift
//  SCLPT
//
//  Created by Developer
//

import UIKit

class APIService: NSObject {
    
//    static func loginAPI(email: String, password: String) {
//        let param = [
//            "email": email,
//            "password": password
//        ] as [String: Any]
//
//        Networking.sharedInstance.postLoginRequest((ApiEndPoints.signIn.rawValue), parameters: param) { (response: Welcome?) in
//            guard let response = response else { return }
//            if response.status == 200 {
//
//                let dataModel = response.data
//                print("data: \(dataModel as Any)")
//            }
//        }
//    }
//
//    static func suuppliersAPI(completion: @escaping ([SuppliersModel])->()) {
//        let param =  [:] as [String : Any]
//
//        Networking.sharedInstance.getRequest(ApiEndPoints.suppliers.rawValue, parameters: param) {(response: GenericModel<[SuppliersModel]>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//
//               let SuppliersModelccc = response.data
//                guard let data = response.data else {return}
//                completion(data)
//
//                var newData: [String] = []
//                for i in SuppliersModelccc ?? [] {
//
//                    newData.append(i.name ?? "")
//                }
//
//               // print("my data" ,dataModel as Any)
//            }
//        }
//    }
//
//    static func categoryAPI() {
//        Networking.sharedInstance.getRequest(ApiEndPoints.suppliers.rawValue) {(response: GenericModel<[SuppliersModel]>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//            }
//        }
//    }
//
//    static func customersAPI() {
//        Networking.sharedInstance.getRequest(ApiEndPoints.suppliers.rawValue) {(response: GenericModel<[SuppliersModel]>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//            }
//        }
//    }
//
//    static func banksAPI() {
//        Networking.sharedInstance.getRequest(ApiEndPoints.suppliers.rawValue) {(response: GenericModel<[SuppliersModel]>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//            }
//        }
//    }
//    static func supplierProductsAPI(supplierID: String, searchKey: String) {
//        let param = [
//            "supplier_id": supplierID,
//            "search_key" : searchKey
//        ] as! [String: Any]
//        Networking.sharedInstance.postRequest(ApiEndPoints.supplierProducts.rawValue, parameters: param, completion: {(respone: GenericModel<SuppliersProductModel>?) in
//            guard let response = respone else {return}
//            if response.status == 200 {
//                let dataModel = respone?.data
//                print("my data" ,dataModel as Any)
//            }
//            })
//        }
//
//    static func saveCustomerAPI(name: String, email: String, phone: Int, address: String) {
//    let param = [
//        "name": name,
//        "email" : email,
//        "phone": phone,
//        "address" : address
//    ] as! [String: Any]
//    Networking.sharedInstance.postRequest(ApiEndPoints.saveCustomer.rawValue, parameters: param, completion: {(respone: GenericModel<SaveCustomerModel>?) in
//        guard let response = respone else {return}
//        if response.status == 200 {
//            let dataModel = respone?.data
//            print("my data" ,dataModel as Any)
//        }
//        })
//    }
//
//    static func categoryProductsAPI(categoryID: Int, searchKey: String) {
//        let param = [
//            "category_id": categoryID,
//            "search_key" : searchKey
//        ] as! [String: Any]
//        Networking.sharedInstance.postRequest(ApiEndPoints.categoryProducts.rawValue, parameters: param, completion: {(respone: GenericModel<CategoryProductsModel>?) in
//            guard let response = respone else {return}
//            if response.status == 200 {
//                let dataModel = respone?.data
//                print("my data" ,dataModel as Any)
//            }
//            })
//        }
//
//    static func savePurchaseAPI
//    (supplier_id: Int, invoice_no: Int, payment_type: Int, bank_id: String, productID: Int, quantity: Int, price: Int) {
//        let param = [
//            "supplier_id": supplier_id,
//            "search_key" : "searchKey"
//        ] as! [String: Any]
//        Networking.sharedInstance.postRequest(ApiEndPoints.savePurchase.rawValue, parameters: param, completion: {(respone: GenericModel<SaveCustomerModel>?) in
//            guard let response = respone else {return}
//            if response.status == 200 {
//                let dataModel = respone?.data
//                print("my data" ,dataModel as Any)
//            }
//            })
//        }
//    static func save_posAPI(supplierID: String, searchKey: String) {
//        let param = [
//            "supplier_id": supplierID,
//            "search_key" : searchKey
//        ] as! [String: Any]
//        Networking.sharedInstance.postRequest(ApiEndPoints.savePOS.rawValue, parameters: param, completion: {(respone: GenericModel<SaveCustomerModel>?) in
//            guard let response = respone else {return}
//            if response.status == 200 {
//                let dataModel = respone?.data
//                print("my data" ,dataModel as Any)
//            }
//            })
//        }
//    }
    
//    static func genderService (screen: String, gender: String, completion: @escaping ()->Void) {
//        //Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "gender": gender,
//            //"apiKey": apiKey
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingGenderModel>?) in
//
//            guard let response = response else {return}
//            if response.status == 200 {
//                //  Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//    static func dobService (screen: String, dob: String, completion: @escaping ()->Void) {
//        // Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "dob": dob,
//            //"apiKey": apiKey
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingDOBModel>?) in //change model name
//            guard let response = response else {return}
//            if response.status == 200 {
//                //  Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//    static func exerciseService (screen: String, exerciseStatus: String, completion: @escaping ()->Void) {
//        //Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "exercise_status": exerciseStatus,
//            //   "apiKey": apiKey
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingExerciseModel>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//                //Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//
//    static func seasonService (screen: String, seasonType: String, dietType: String, completion: @escaping () -> Void) {
//        //Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "season_type": seasonType,
//            "diet_type": dietType
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingSeasonModel>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//                // Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//            }
//
//        }
//    }
//
//
//    static func dietService (screen: String, seasonType: String, dietType: String, view: UIView, completion: @escaping () -> Void) {
//        //Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "season_type": seasonType,
//            "diet_type": dietType
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingSeasonModel>?) in // change model name
//            guard let response = response else {return}
//            if response.status == 200 {
//                //Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//            }
//
//        }
//    }
//    static func dobService (screen: String, height: String, unit: String, completion: @escaping ()->Void) {
//        // Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "height": height,
//            "unit": unit
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingHeightModel>?) in //change model name
//            guard let response = response else {return}
//            if response.status == 200 {
//                //   Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//
//    static func heightService (screen: String, height: String, unit: String, completion: @escaping ()->Void) {
//        //Constants.loader.show(in: view)
//
//        let param = [
//            "screen": screen,
//            "height": height,
//            "unit": unit
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingHeightModel>?) in
//            guard let response = response else {return}
//            if response.status == 200 {
//                //  Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//    static func currentweightService (screen: String, weight: String, unit: String, completion: @escaping ()->Void) {
//        // Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "weight": weight,
//            "unit": unit
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingCurrentWeightModel>?) in
//
//            guard let response = response else {return}
//            if response.status == 200 {
//                //Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//    static func targetweightService (screen: String, weight: String, unit: String, completion: @escaping ()->Void) {
//        // Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "weight": weight,
//            "unit": unit
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingWeightModel>?) in // change model name
//
//            guard let response = response else {return}
//            if response.status == 200 {
//                // Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//    static func sportSelectionService (screen: String, sport_1: [String], completion: @escaping () -> Void) {
//        // Constants.loader.show(in: view)
//        let param = [
//            "screen": screen,
//            "sport":sport_1,
//        ] as [String: Any]
//
//        Networking.sharedInstance.postRequest(ApiEndPoints.onboardingprofile.rawValue, parameters: param) {(response: GenericModel<OnboardingSportModel>?) in // change model name
//            guard let response = response else {return}
//            if response.status == 200 {
//                //Constants.loader.dismiss(animated: true)
//
//                let dataModel = response.data
//                print("my data" ,dataModel as Any)
//                completion()
//                //  DispatchQueue.main.async {
//                //  self.navigationController?.popViewController(animated: true)
//                //   }
//
//            }
//
//        }
//    }
//    //sport cell
//    //static func sportCellService () {
//    //    let param =  [:] as [String : Any]
//    //
//    //    Networking.sharedInstance.getRequest(ApiEndPoints.onboardingSportsCell.rawValue, parameters: param) {(response: GenericModelWithArray<[OnboardingSportsCellModel]>?) in
//    //        guard let response = response else {return}
//    //        if response.status == 200 {
//    //            let dataModel = response.data
//    //            print("my data" ,dataModel as Any)
//    //            //  DispatchQueue.main.async {
//    //            //  self.navigationController?.popViewController(animated: true)
//    //            //   }
//    //
//    //        }
//    //
//    //    }
//    //}
//
}
