//
//  Flag.swift
//  Conversor
//
//  Created by Robert Recorda on 31/10/18.
//  Copyright © 2018 Robert Recorda. All rights reserved.
//

import Foundation

class Flag{
    var flag:String = ""
    var bg:String = ""
    var coinValue:Double = 0
    
    init(flag:String, bg:String, coinValue:Double){
        self.flag = flag
        self.bg = bg
        self.coinValue = coinValue
    }
    
    func getFlag() -> String {
        return self.flag
    }
    
    func getBg() -> String {
        return self.bg
    }
    
    func getCoinValue() -> Double {
        return self.coinValue
    }
}
