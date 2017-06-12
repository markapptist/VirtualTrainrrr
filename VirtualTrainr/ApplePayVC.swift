//
//  ApplePayVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 10/4/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import PassKit
import Stripe

class ApplePayVC: UIViewController {
    
    var applePayButton: UIButton!
    let applePayImage = UIImage(named: "ApplePayButton")
    
    let SupportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex]
    let VTMerchantID = "merchant.com.com.VirtualTrainr"
    
    let appointment = Appointment(price: NSDecimalNumber(string: "50.0"), session: "06-01-17", description: "1 hour session")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        applePayButton = UIButton(frame: CGRect(x: view.center.x - 50, y: view.center.y - 16, width: 100, height: 32))
        applePayButton.contentMode = .scaleAspectFit
        applePayButton.setBackgroundImage(applePayImage, for: .normal)
        applePayButton.addTarget(self, action: #selector(self.applePayBtnFunction), for: .touchUpInside)
        
        applePayButton.isHidden = !PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: SupportedPaymentNetworks)
        
        view.addSubview(applePayButton)
    }
    
    func applePayBtnFunction() {
        
        let request = PKPaymentRequest()
        
        request.merchantIdentifier = VTMerchantID
        request.supportedNetworks = SupportedPaymentNetworks
        request.merchantCapabilities = PKMerchantCapability.capability3DS
        request.countryCode = "CA"
        request.currencyCode = "CAD"
        
        var summaryItems = [PKPaymentSummaryItem]()
        
        let paymentItem1 = PKPaymentSummaryItem(label: appointment.description, amount: appointment.price)
        let paymentItem2 = PKPaymentSummaryItem(label: "Receipient", amount: appointment.total())
        
        summaryItems.append(paymentItem1)
        summaryItems.append(paymentItem2)
        
        request.paymentSummaryItems = summaryItems
        
        // if item requires shipping address
//        request.requiredShippingAddressFields = PKAddressField.all
        
        let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
        applePayController.delegate = self
        
        self.present(applePayController, animated: true, completion: nil)
    }

}

extension ApplePayVC: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Swift.Void) {
        
        STPAPIClient.shared().createToken(with: payment) { (token, error) in
            if error != nil {
                print(error?.localizedDescription)
                completion(.failure)
                return
            }
            
            // processed with token
            print(token?.tokenId)
            print("done")

            completion(.success)
        }

    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        
        controller.dismiss(animated: true, completion: nil)
    }
}
