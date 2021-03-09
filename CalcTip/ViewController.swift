//
//  ViewController.swift
//  CalcTip
//
//  Created by Carlos Castillo on 3/8/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//    @IBOutlet weak var twentyPercentLabel: UIButton!
    
    
    @IBOutlet var tenPercent: UILabel!
  
    @IBOutlet weak var fifteenPercentLabel: UILabel!
    
    @IBOutlet weak var twentyPercentLabel: UILabel!
    
    @IBOutlet weak var TotalAmountTF: UILabel!
    
    @IBOutlet weak var CalculateTotalTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CalculateTotalTF.delegate = self
        
       
    }
    

    @IBAction func CalculateButtonPressed(_ sender: Any) {
        print("Calculating Tip")
        hideKeyboard()
        calculateAllTips()
    }

    func hideKeyboard() {
        CalculateTotalTF.resignFirstResponder()
    }

    func calculateAllTips() {
        
        guard let subTotal = convertCurrencyToDouble(input:
        TotalAmountTF.text!)else{
            print("Not a number!: \(TotalAmountTF.text!)")
            return
        }
        print("Total before Tips  : \(subTotal)")
        
        let tip1 = calculateTip(subtotal: subTotal, tipPercentage: 10.0)
        let tip2 = calculateTip(subtotal: subTotal, tipPercentage: 15.0)
        let tip3 = calculateTip(subtotal: subTotal, tipPercentage: 20.0)
        
        
        tenPercent.text = convertDoubleToCurrency(amount: tip1)
       
        fifteenPercentLabel.text = convertDoubleToCurrency(amount: tip2)
       
        twentyPercentLabel.text = convertDoubleToCurrency(amount: tip3)
    }
    
    //calculate the tip percentage by tip(n)*(PercentageRequired)/100
    
    func calculateTip(subtotal: Double, tipPercentage: Double)->Double{
            return subtotal * (tipPercentage / 100.0)
        }
        
    //fix number format to currency
    func convertCurrencyToDouble(input: String) -> Double? {
       
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .currency
        
        numberFormatter.locale = Locale.current
        
        return numberFormatter.number(from: input)?.doubleValue
        
    }
    
    func convertDoubleToCurrency(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
      
        numberFormatter.numberStyle = .currency
        
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from:
                                        
        NSNumber(value: amount))!
    }
    //Attempt but many errors to get keyboard info
    /*
    NotificationCenter.default.addObserver(self, selector:  .UIKeyboardWillChangeFrame, object: nil) .

    @objc func keyboardWillChange (notification: NSNotification) {
         let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
         let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
         let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue)
         let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
         let Y = targetFrame.origin.y - curFrame.origin.y
     }
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        hideKeyboard()
        
        calculateAllTips()
        
        return true
    }
}

