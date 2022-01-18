//
//  ViewController+CollectionViewDelegateAndDatSource.swift
//  VoltM
//  Created by Eslam Sebaie on 9/19/21.

import UIKit

extension PaymentVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let paymentMethods = paymentMethods else {
            return 0
        }
        return paymentMethods.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PaymentMethodCollectionViewCell
        cell.contentView.layer.cornerRadius = 25
        cell.contentView.layer.masksToBounds = true
        if let paymentMethods = paymentMethods, !paymentMethods.isEmpty {
            
            let selectedIndex = selectedPaymentMethodIndex ?? -1
            cell.configure(paymentMethod: paymentMethods[indexPath.row], selected: selectedIndex == indexPath.row)
        }
        return cell
    }
    
}

extension PaymentVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPaymentMethodIndex = indexPath.row
        payButton.isEnabled = true
        payButton.backgroundColor = ColorName.ableColor.color
        payButton.setTitle("Pay via \(paymentMethods?[indexPath.row].paymentMethodCode ?? "")", for: .normal)
        if let paymentMethods = paymentMethods {
            if paymentMethods[indexPath.row].isDirectPayment {
                hideCardInfoStacksView(isHidden: false)
            } else {
                hideCardInfoStacksView(isHidden: true)
            }
        }
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = (0.35 * self.view.bounds.size.width) - 40
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
