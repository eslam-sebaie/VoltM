//
//  CountryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CountryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    @IBOutlet var countryView: CountryView!
    var delegate: sideMenuProtocol?
    var image = ["Egypt":"egypt2", "Saudi Arabia":"saudi-arabia", "Kuwait":"kwait2", "Syrian":"syria","Lebanon":"lebanon", "Qatar":"qatar"]
    var countryDic = [String:Int]()
    var idArray = [Int]()
    var nameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        countryView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> CountryVC {
        let countryVC: CountryVC = UIViewController.create(storyboardName: Storyboards.sideMenu, identifier: ViewControllers.countryVC)
        return countryVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getAllCountries()
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
                
                self.view.hideLoader()
                self.countryView.countryCollection.reloadData()
                
            }
        }
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.showTable()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = countryView.countryCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CountryCollectionViewCell
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
        print("SebaieYoussef")
        print(UserDefaultsManager.shared().country)
        print(UserDefaultsManager.shared().countryId)
        let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
        let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
        self.present(tabVC, animated: true, completion: nil)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = CGFloat(100)
        let yourHeight = CGFloat(100)

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



