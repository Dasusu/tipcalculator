//
//  TipCalculator.swift
//  tipcalculator
//
//  Created by Dasu on 2021/7/22.
//

import Foundation

class TipCalculator {
    var moneybeforetex: Double = 0
    var tipAmount: Double = 0
    var tippercentage: Double = 0
    var totalmoney: Double = 0
    
    
    init(money: Double, tippercent: Double){
        self.moneybeforetex = money
        self.tippercentage = tippercent
    }
    
    func calculateTip() {
        tipAmount = moneybeforetex * tippercentage
        totalmoney = tipAmount + moneybeforetex
    }
    
}
