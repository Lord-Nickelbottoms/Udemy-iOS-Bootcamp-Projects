//
//  TipCalculatorViewModel.swift
//  Tipsy
//
//  Created by Nizaam Haffejee on 2024/04/04.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


class TipCalculatorViewModel {
    
    var result: Float = 0.0
    
    func calculateTip(billTotal: Float, tipPercentage: Float, tipSplitValue: Int) {
        result = (billTotal + (billTotal * tipPercentage)) / Float(tipSplitValue)
        print(result)
    }
    
    var getResult: Float {
        return result
    }
}
