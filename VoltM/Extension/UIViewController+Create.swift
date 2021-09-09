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
        let action = UIAlertAction(title: "OK", style: .default) { (action) in}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
  
    func showAlert(title: String,massage: String, present : UIViewController,titleBtn: String, completion: @escaping()->Void){
            let  alertError = UIAlertController(title: title , message: massage , preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: titleBtn, style: .default, handler: { action in
                completion()
            }))
          
            alertError.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
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
