//
//  PagesVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//

import UIKit

class PagesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var pageImage = ["Mobile login-cuate", "Mobile login-cuate", "Mobile login-cuate"]
    var pageContent = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnaaliqua. Ut enim ad minim veniam", "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", "Eslam Sebaie"]

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
        cell.pageContent.text = pageContent[indexPath.row]
        
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
