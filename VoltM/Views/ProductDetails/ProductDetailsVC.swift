//
//  ProductDetailsVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    @IBOutlet var productDetailsView: ProductDetailsView!
    var receiveProducts = ProductInfo(id: 0, name: ProductLocalize(en: "", ar: ""), image: "", price: 0, newPrice: 0, desc: ProductLocalize(en: "", ar: ""), offer: false)
    var imageLoader = ImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetailsView.updateUI()
        imageLoader.obtainImageWithPath(imagePath: receiveProducts.image ?? "") { (image) in
            self.productDetailsView.productImage.image = image
        }
        productDetailsView.productPrice.text = "\(receiveProducts.price ?? 0) \(getCountryCurrency())"
        if L10n.lang.localized == Language.arabic {
            productDetailsView.productName.text = receiveProducts.name?.ar
        }
        else {
            productDetailsView.productName.text = receiveProducts.name?.en
        }
    }
    class func create() -> ProductDetailsVC {
        let productDetailsVC: ProductDetailsVC = UIViewController.create(storyboardName: Storyboards.products, identifier: ViewControllers.productDetailsVC)
        return productDetailsVC
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    @IBAction func favPressed(_ sender: Any) {
        
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func stepperPressed(_ sender: UIStepper) {
        productDetailsView.productQty.text = "\(sender.value)"
        if sender.value == 0.0 {
            productDetailsView.continueDesign.isEnabled = false
            productDetailsView.continueDesign.backgroundColor = ColorName.diableButton.color
        }
        else {
            productDetailsView.continueDesign.isEnabled = true
            productDetailsView.continueDesign.backgroundColor = ColorName.ableColor.color
        }
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        print("in continue")
    }
    
}
class ImageLoader {
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        task = URLSessionDownloadTask()
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping (UIImage) -> ()) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let jeremyGif = UIImage.gifImageWithName("circle")
            
            let placeholder = jeremyGif!
            DispatchQueue.main.async {
                completionHandler(placeholder)
            }
            let url: URL! = URL(string: imagePath)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            })
            task.resume()
        }
    }
}


