//
//  ViewController+MFSDKServicesCall.swift
//  MFSDKDemo-Swift
//  VoltM
//  Created by Eslam Sebaie on 9/19/21.

import MFSDK

extension PaymentVC {
    func initiatePayment() {
        let request = generateInitiatePaymentModel()
        self.view.showLoader()
        MFPaymentRequest.shared.initiatePayment(request: request, apiLanguage: .english, completion: { [weak self] (result) in
            self?.view.hideLoader()
            switch result {
            case .success(let initiatePaymentResponse):
                self?.paymentMethods = initiatePaymentResponse.paymentMethods
                let newMethods = self?.paymentMethods
                self?.paymentMethods = []

                for i in 0..<newMethods!.count {
                    if newMethods?[i].paymentMethodEn == "VISA/MASTER" ||
                        newMethods?[i].paymentMethodEn == "KNET"  {
                        self?.paymentMethods?.append((newMethods?[i])!)
                    }
                }
                self?.collectionView.reloadData()
            case .failure( _):
                self?.showFailError()
            }
        })
    }
    
    func executeDirectPayment(paymentMethodId: Int) {
        let request = getExecutePaymentRequest(paymentMethodId: paymentMethodId)
        let card = getCardInfo()
        self.view.showLoader()
        MFPaymentRequest.shared.executeDirectPayment(request: request, cardInfo: card, apiLanguage: .english) { [weak self] (response, invoiceId) in
            self?.view.hideLoader()
            switch response {
            case .success(let directPaymentResponse):
                if let cardInfoResponse = directPaymentResponse.cardInfoResponse, let card = cardInfoResponse.cardInfo {
                    self?.showSuccess(invoiceId ?? "")
                    UserDefaultsManager.shared().cardNumber = card.number
                    UserDefaultsManager.shared().cardHolderName = self?.cardHolderNameTextField.text ?? ""
                    UserDefaultsManager.shared().monthText = card.expiryMonth
                    UserDefaultsManager.shared().yearText = card.expiryYear
                }
            case .failure( _):
                self?.showFailError()
            }
        }
    }
    
    func executePayment(paymentMethodId: Int) {
        let request = getExecutePaymentRequest(paymentMethodId: paymentMethodId)
        self.view.showLoader()
        MFPaymentRequest.shared.executePayment(request: request, apiLanguage: .english) { [weak self] response, invoiceId  in
            self?.view.hideLoader()
            switch response {
            case .success(let executePaymentResponse):
                if let invoiceStatus = executePaymentResponse.invoiceStatus {
                    self?.showSuccess(invoiceId ?? "")
                }
            case .failure(let error):
                print("Error Status Code: \(error.statusCode)")
                print("Error Description: \(error.errorDescription)")
                self?.showFailError()
            }
        }
    }
    
    

}
extension PaymentVC {
    private func generateInitiatePaymentModel() -> MFInitiatePaymentRequest {
        let request = MFInitiatePaymentRequest()
        return request
    }
    
    private func getCardInfo() -> MFCardInfo {
        let cardNumber = cardNumberTextField.text ?? ""
        let cardExpiryMonth = monthTextField.text ?? ""
        let cardExpiryYear = yearTextField.text ?? ""
        let cardSecureCode = secureCodeTextField.text ?? ""
        let cardHolderName = cardHolderNameTextField.text ?? ""

        
        let card = MFCardInfo(cardNumber: cardNumber, cardExpiryMonth: cardExpiryMonth, cardExpiryYear: cardExpiryYear, cardHolderName: cardHolderName, cardSecurityCode: cardSecureCode, saveToken: false)
//        card.bypass = false // default is true
        return card
    }
    private func getExecutePaymentRequest(paymentMethodId: Int) -> MFExecutePaymentRequest {
        let invoiceValue = Decimal(string: String(5.0)) ?? 0
        let request = MFExecutePaymentRequest(invoiceValue: invoiceValue , paymentMethod: paymentMethodId)
        request.customerEmail = "Muaddi.7@gmail.com"
        request.customerMobile = "1142373945"
        request.customerName = "VoltM"
        
        request.mobileCountryCode = MFMobileCountryCodeISO.egypt.rawValue
        request.displayCurrencyIso = .Egyptian_Pound_EGP
        
        request.language = .english
        if UserDefaultsManager.shared().countryId == 1 {
            request.mobileCountryCode = MFMobileCountryCodeISO.egypt.rawValue
            request.displayCurrencyIso = .Egyptian_Pound_EGP
        }
        else if UserDefaultsManager.shared().countryId == 2 {
            request.mobileCountryCode = MFMobileCountryCodeISO.saudiArabia.rawValue
            request.displayCurrencyIso = .saudiArabia_SAR
        }
        else if UserDefaultsManager.shared().countryId == 3 {
            request.mobileCountryCode = MFMobileCountryCodeISO.kuwait.rawValue
            request.displayCurrencyIso = .kuwait_KWD
        }
        else if UserDefaultsManager.shared().countryId == 6 {
            request.mobileCountryCode = MFMobileCountryCodeISO.qatar.rawValue
            request.displayCurrencyIso = .qatar_QAR
        }
        else {
            request.mobileCountryCode = MFMobileCountryCodeISO.kuwait.rawValue
            request.displayCurrencyIso = .kuwait_KWD
        }
        return request
    }
    
    func executeApplePayPayment(paymentMethodId: Int) {
        print("Removed")
    }
}
