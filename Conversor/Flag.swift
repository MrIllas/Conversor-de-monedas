//
//  Flag.swift
//  Conversor
//
//  Created by Robert Recorda on 31/10/18.
//  Copyright © 2018 Robert Recorda. All rights reserved.
//

import Foundation

class Flag{
    var flag:String
    var bg:String
    var coinValueEuro:Double //The value equivalent to 1 €
    var coinValueBase:Double //The value of 1 of its kind
    var coinName:String
    
    init(flag:String, bg:String, coinValueEuro:Double, coinName:String, coinValueBase:Double){
        self.flag = flag
        self.bg = bg
        self.coinValueEuro = coinValueEuro
        self.coinName = coinName
        self.coinValueBase = coinValueBase
    }
    
    func getFlag() -> String {
        return self.flag
    }
    
    func getBg() -> String {
        return self.bg
    }
    
    func getCoinValueEuro() -> Double {
        return self.coinValueEuro
    }
    
    func getCoinName() -> String {
        return self.coinName
    }
    
    func getCoinValueBase() -> Double{
        return self.coinValueBase
    }
}
