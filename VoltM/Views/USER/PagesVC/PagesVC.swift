//
//  PagesVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//

import UIKit

class PagesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var pageImage = ["pageService", "pageUser"]
    var pageContent = ["Voltm App, a Saudi team of cadres for home electrical maintenance, saves you the trouble of searching and effort for technicians specialized in maintenance in particular. ", "And the trouble of searching in the lighting and communications section by providing the best local products in lighting and communications of various known types, you can find them in their own sections within the application."]
    var pageContentAR = ["تطبيق فولتم فريق عمل بكوادر سعوديه للصيانه الكهربيه المنزليه يوفر عليك عناء البحث والجهد عن فنيين مختصين بالصيانه بشكل خاص", "وعناء البحث في قسم الاناره والاتصالات بتوفير افضل المنتجات المحليه في الاناره والاتصالات من مختلف الانواع المعروفه تجدها في اقسامها الخاصه بها داخل التطبيق"]
    @IBOutlet var pagesView: PagesView!
    var pageControl = 0 {
        didSet {
            pagesView.pageControl.currentPage = pageControl
            if pageControl == pageImage.count - 1 {
                if L10n.lang.localized == Language.arabic {
                    pagesView.nextDesign.setTitle("إبدأ", for: .normal)
                }
                else {
                    pagesView.nextDesign.setTitle("Start", for: .normal)
                }
            }
            else {
                if L10n.lang.localized == Language.arabic {
                    pagesView.nextDesign.setTitle("التالي", for: .normal)
                }
                else {
                    pagesView.nextDesign.setTitle("Next", for: .normal)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pagesView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> PagesVC {
        let pagesVC: PagesVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.pagesVC)
        return pagesVC
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        if pageControl == pageImage.count - 1 {
            let signIn = SignInVC.create()
            self.present(signIn, animated: true, completion: nil)
        }
        else {
            pageControl += 1
            pagesView.pagesCollection.isPagingEnabled = false
            let indexPath = IndexPath(item: pageControl, section: 0)
            pagesView.pagesCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.pagesView.pagesCollection.setNeedsLayout()
            pagesView.pagesCollection.isPagingEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pagesView.pagesCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PagesCollectionViewCell
        cell.pageImage.image = UIImage(named: pageImage[indexPath.row])
        if L10n.lang.localized == Language.arabic {
            cell.pageContent.text = pageContentAR[indexPath.row]
            cell.pageContent.textAlignment = .right
        }
        else {
            cell.pageContent.text = pageContent[indexPath.row]
        }

        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pagesView.pagesCollection.frame.size.width, height: pagesView.pagesCollection.frame.size.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        pageControl = Int(scrollView.contentOffset.x / width)
        pagesView.pageControl.currentPage = pageControl
    }
    
}
