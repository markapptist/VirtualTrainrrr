//
//  PayPal.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 27/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class PayPalVC: UIViewController, PayPalPaymentDelegate {
    
    var payPalConfig = PayPalConfiguration()
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    
    var payPalBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payPalBtn = UIButton(type: .system)
        payPalBtn?.setTitle("Single PayPal", for: .normal)
        payPalBtn?.addTarget(self, action: #selector(self.buyAction(_:)), for: .touchUpInside)
        self.view.addSubview(payPalBtn!)
        payPalBtn?.translatesAutoresizingMaskIntoConstraints = false
        payPalBtn?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        payPalBtn?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        payPalBtn?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        payPalBtn?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Set up payPalConfig
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "Awesome Shirts, Inc."
        
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        
        payPalConfig.payPalShippingAddressOption = .payPal;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        PayPalMobile.preconnect(withEnvironment: environment)
    }
    
    // Single Payment
    func buyAction(_ sender: AnyObject) {
        
        // Optional: include multiple items
        let item1 = PayPalItem(name: "Old jeans with holes", withQuantity: 2, withPrice: NSDecimalNumber(string: "84.99"), withCurrency: "USD", withSku: "Hip-0037")
        let item2 = PayPalItem(name: "Free rainbow patch", withQuantity: 1, withPrice: NSDecimalNumber(string: "0.00"), withCurrency: "USD", withSku: "Hip-00066")
        let item3 = PayPalItem(name: "Long-sleeve plaid shirt (mustache not included)", withQuantity: 1, withPrice: NSDecimalNumber(string: "37.99"), withCurrency: "USD", withSku: "Hip-00291")
        
        let items = [item1, item2, item3]
        let subtotal = PayPalItem.totalPrice(forItems: items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "5.99")
        let tax = NSDecimalNumber(string: "2.50")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.adding(shipping).adding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Hipster Clothing", intent: .sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
            print("Payment not processalbe: \(payment)")
        }
        
    }
    
    // PayPalPaymentDelegate
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
            // success
        })
    }
    
}
