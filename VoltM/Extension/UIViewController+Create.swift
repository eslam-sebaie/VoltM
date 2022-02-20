//
//  UIViewController+Create.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    public func show_Alert(_ title: String, _ msg: String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: L10n.ok.localized, style: .default) { (action) in}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    func getCountryCurrency() -> String {
        if UserDefaultsManager.shared().countryId == 1 {
            return "EGP"
        }
        else if UserDefaultsManager.shared().countryId == 2 {
            return "SAR"
        }
        else if UserDefaultsManager.shared().countryId == 3 {
            return "KWD"
        }
        else if UserDefaultsManager.shared().countryId == 4 {
            return "SYP"
        }
        else if UserDefaultsManager.shared().countryId == 5 {
            return "LBP"
        }
        else if UserDefaultsManager.shared().countryId == 6 {
            return "QAR"
        }
        else {
            return ""
        }
    }
  
    func showAlert(title: String,massage: String, present : UIViewController,titleBtn: String, completion: @escaping()->Void){
            let  alertError = UIAlertController(title: title , message: massage , preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: titleBtn, style: .default, handler: { action in
                completion()
            }))
          
            //alertError.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present.self.present(alertError, animated: true)
        }
    
    func showAlert1(title: String,massage: String, present : UIViewController,titleBtn: String, completion: @escaping()->Void, completion1: @escaping()->Void){
            let  alertError = UIAlertController(title: title , message: massage , preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: titleBtn, style: .default, handler: { action in
                completion()
            }))
          
        alertError.addAction(UIAlertAction(title: L10n.cancel.localized, style: .cancel, handler: { action in
                completion1()
            }))
            
            present.self.present(alertError, animated: true)
        }

    
    func convertTimeStamp(date: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "E, d MMM yyyy/h:mm a"
        let strDate = dateFormatter.string(from: date)
        let array = strDate.components(separatedBy: CharacterSet(charactersIn: "/"))
        return array[0]
    }
}
extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}
