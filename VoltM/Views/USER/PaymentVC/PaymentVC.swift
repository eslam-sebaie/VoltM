//
//  ViewController.swift
//  VoltM
//  Created by Eslam Sebaie on 9/19/21.

import UIKit
import MFSDK

class PaymentVC: UIViewController {
    
    //MARK: Variables
    var paymentMethods: [MFPaymentMethod]?
    var selectedPaymentMethodIndex: Int?
    var receiveCartID = 0
    var receiveTotalPrice = 0.0
    
    //MARK: Outlet
    @IBOutlet weak var errorCodeLabel : UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var cardInfoStackViews: [UIStackView]!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var cardHolderNameTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var secureCodeTextField: UITextField!
    @IBOutlet weak var sendPaymentActivityIndicator: UIActivityIndicatorView!
    
    
    //at list one product Required
    let productList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.text = "\(receiveTotalPrice) \(getCountryCurrency())"
        payButton.isEnabled = false
        payButton.backgroundColor = ColorName.diableButton.color
        collectionView.layer.cornerRadius = 8
        collectionView.layer.masksToBounds = true
        setCardInfo()
        initiatePayment()
    }
    class func create() -> PaymentVC {
        let paymentVC: PaymentVC = UIViewController.create(storyboardName: Storyboards.payment, identifier: ViewControllers.paymentVC)
        return paymentVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func payDidPRessed(_ sender: Any) {
        if let paymentMethods = paymentMethods, !paymentMethods.isEmpty {
            if let selectedIndex = selectedPaymentMethodIndex {
                
                if paymentMethods[selectedIndex].paymentMethodCode == MFPaymentMethodCode.applePay.rawValue {
                    executeApplePayPayment(paymentMethodId: paymentMethods[selectedIndex].paymentMethodId)
                } else if paymentMethods[selectedIndex].isDirectPayment {
                    executeDirectPayment(paymentMethodId: paymentMethods[selectedIndex].paymentMethodId)
                } else {
                    executePayment(paymentMethodId: paymentMethods[selectedIndex].paymentMethodId)
                }
            }
        }
    }
    
    func showSuccess(_ invoice: String) {
        print("SEBBBB in success")
        self.view.showLoader()
        
        APIManager.confirmCart(cart_id: receiveCartID, user_id: UserDefaultsManager.shared().userId ?? 0, payment_method: "Payment Card", invoice_id: Int(invoice) ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                }
                else {
                    self.view.hideLoader()
                    self.showAlert(title: L10n.success.localized, massage: L10n.yourRequestWillBeProcced.localized, present: self, titleBtn: L10n.ok.localized) {
                        let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                        let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                        self.present(tabVC, animated: true, completion: nil)
                    }
                    
                }
            }
        }
        // make delegation
        // confirm Order
    }
    
    func showFailError() {
        print("SEBBBB in ERRORRO")
//        make delegation
        APIManager.getAllCountriesStores { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success( _):
                self.view.hideLoader()
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
            }
        }
    }
    func hideCardInfoStacksView(isHidden: Bool) {
        for stackView in cardInfoStackViews {
            stackView.isHidden = isHidden
        }
    }
    private func setCardInfo() {
        cardNumberTextField.text = UserDefaultsManager.shared().cardNumber
        cardHolderNameTextField.text = UserDefaultsManager.shared().cardHolderName
        monthTextField.text = UserDefaultsManager.shared().monthText
        yearTextField.text = UserDefaultsManager.shared().yearText
        secureCodeTextField.text = ""
    }
}
