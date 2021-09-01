//
//  ViewController.swift
//  tipcalculator
//
//  Created by Dasu on 2021/7/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var money: UITextField!
    
    @IBOutlet weak var tipmoney: UILabel!
        
    @IBOutlet weak var totalmoney: UILabel!
    
    @IBOutlet weak var tippercent: UILabel!
    
    @IBOutlet weak var tiprange: UISlider!
    
    
    var tipCalculator = TipCalculator(money: 0, tippercent: 0.10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tiprange.minimumValue = 0
        tiprange.maximumValue = 50
        
        money.keyboardType = UIKeyboardType.numberPad
        self.view.addSubview(money)
        
        addDoneButtonOnKeyboard()

    }
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        var items:[UIBarButtonItem] = []
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.money.inputAccessoryView = doneToolbar
    
    }
    
    @objc func doneButtonAction() {
        self.money.resignFirstResponder()
    
    }
    
    func calculateBill() {
        tipCalculator.tippercentage = Double(tiprange.value) / 100.0
    
        tipCalculator.calculateTip()
        updateUI()
    }
    
    
    func updateUI() {
        totalmoney.text = String(format: "$%0.2f", tipCalculator.totalmoney)
        tipmoney.text = String(format: "$%0.2f", tipCalculator.tipAmount)
    }
    
    
    @IBAction func tipSliderValueChanged(sender:Any){
        tippercent.text = String(format: "Tip: (%d%%)",Int(tiprange.value))
        calculateBill()
    }

    @IBAction func textfieldmoneychange(_ sender: Any) {
        tipCalculator.moneybeforetex = (money.text! as NSString).doubleValue
        money.text = String(format: "$%0.2f", tipCalculator.moneybeforetex)
    }
}

