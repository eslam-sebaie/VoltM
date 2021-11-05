//
//  ChooseCountryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//

import UIKit

class ChooseCountryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var chooseCountryView: ChooseCountryView!
    var name = ["Egypt", "UAE", "Lebanon"]
    var image = ["egypt2", "kwait2", "lebanon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseCountryView.determineCollectionViewSpacing()
        chooseCountryView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> ChooseCountryVC {
        let chooseCountryVC: ChooseCountryVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.chooseCountryVC)
        return chooseCountryVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chooseCountryView.countryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! chooseCountryCollectionViewCell
//        cell.catImage.sd_setImage(with: URL(string: catImage[indexPath.row]), completed: nil)
        cell.countryImage.image = UIImage(named: image[indexPath.row])
        cell.countryImage.layer.cornerRadius = 40
        cell.countryImage.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = CGFloat(104)
        let yourHeight = CGFloat(104)

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}
