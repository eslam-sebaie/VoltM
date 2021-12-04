//
//  MapVCView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//
import MapKit
import CoreLocation
class MapVCView: UIView {
    

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var backDesign: UIButton!
    
    @IBOutlet weak var deliveryLabel: UILabel!
    
    @IBOutlet weak var delivery: UILabel!
    let locationManager = CLLocationManager()
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            saveButton.setTitle("تأكيد", for: .normal)
            backDesign.setImage(Asset.backAr.image, for: .normal)
            deliveryLabel.text = "عنوانك"
            delivery.text = "عنوانك"
        }
        mapView.setCornerRadius(radius: 20)
        saveButton.layer.cornerRadius = 8
        saveButton.layer.masksToBounds = true
        
    }
    
}
