//
//  ChooseCountryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//

import UIKit

class ChooseCountryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var chooseCountryView: ChooseCountryView!
    var image = ["Egypt":"egypt2", "Saudi Arabia":"saudi-arabia", "Kuwait":"kwait2", "Syrian":"syria","Lebanon":"lebanon", "Qatar":"qatar"]
    var countryDic = [String:Int]()
    var idArray = [Int]()
    var nameArray = [String]()
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
    override func viewWillAppear(_ animated: Bool) {
        getAllCountries()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAllCountries(){
        self.view.showLoader()
        APIManager.getAllCountriesStores { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
               
                for i in result.data ?? []{
                    self.nameArray.append(i.country?.name ?? "")
                    self.idArray.append(i.countryID ?? 0)
                    self.countryDic[i.country?.name ?? ""] = i.countryID ?? 0
                }
                self.nameArray = Array(Set(self.nameArray))
                print("Sebaie")
                print(self.nameArray)
                self.view.hideLoader()
                self.chooseCountryView.countryCollectionView.reloadData()
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chooseCountryView.countryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! chooseCountryCollectionViewCell
        cell.countryImage.image = UIImage(named: image[nameArray[indexPath.row]] ?? "")
        cell.countryImage.layer.cornerRadius = 40
        cell.countryImage.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaultsManager.shared().country = nameArray[indexPath.row]
        UserDefaultsManager.shared().countryId = countryDic[nameArray[indexPath.row]]
        let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
        let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
        self.present(tabVC, animated: true, completion: nil)
        
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
