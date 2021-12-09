//
//  SubServicesVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/9/21.
//

import UIKit

class SubServiceVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var subServiceView: SubServiceView!
    var receiveServiceID = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func create() -> SubServiceVC {
        let subServiceVC: SubServiceVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.subServiceVC)
        return subServiceVC
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
