//
//  ViewController.swift
//  Conversor
//
//  Created by Robert Recorda on 31/10/18.
//  Copyright © 2018 Robert Recorda. All rights reserved.
//

import UIKit

var europe:Flag?
var japan:Flag?
var korea:Flag?
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    

    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var labelConversionPhrase: UILabel!
    @IBOutlet weak var labelConversionValue: UILabel!
    
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var labelCoinName: UILabel!
    @IBOutlet weak var labelValueTotal: UILabel!
    @IBOutlet weak var btnBefore: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var imgNoTouch: UIImageView!
    
    var flagSelValue:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceIni()
        flagIni()
    }
    
    
    
    //Conversor part
    var coin = ["Euro", "Yen", "Won"]
    var row1:String! = "Euro"
    var row2:String! = "Euro"
    var auxStr:String = ""
    var finalValue:Double = 0.0
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coin.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coin[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            row1 = coin[row]
        }else if(component == 1){
            row2 = coin[row]
        }
        print(coin[row])
    }
    @IBAction func onConvertClick(_ sender: Any) {
        auxStr = amount.text!
        finalValue = Double(auxStr)!
        //All values to Eur
        switch(row1){
            case "Euro":
                print("no need")
            break;
            case "Yen":
                finalValue = finalValue * japan!.getCoinValueBase()
            break;
            case "Won":
                finalValue = finalValue * korea!.getCoinValueBase()
            break;
            default:
                print("Row1: \(row1)")
        }
        
        //Then to the row2 dessignated coin
        switch(row2){
            case "Euro":
                print("no need")
                labelConversionValue.text = "\(finalValue)€"
                break;
            case "Yen":
                finalValue = finalValue * japan!.getCoinValueEuro()
                labelConversionValue.text = "\(finalValue)¥"
                break;
            case "Won":
                finalValue = finalValue * korea!.getCoinValueEuro()
                labelConversionValue.text = "\(finalValue)₩"
                break;
            default:
                print("Row2: \(row2)")
        }
        
    }
    
    
    //Flag part
    @IBAction func onNextClick(_ sender: Any) {
        if(flagSelValue == 2){
            flagSelValue = 0
        }else{
            flagSelValue = flagSelValue + 1;
        }
        flagSelector(value: flagSelValue)
    }
    
    @IBAction func onBeforeClick(_ sender: Any) {
        if(flagSelValue == 0){
            flagSelValue = 2
        }else{
            flagSelValue = flagSelValue - 1;
        }
        flagSelector(value: flagSelValue)
    }
    
    func flagSelector(value:Int){
        switch(value){
            case 0:
                imgFlag.image = UIImage(named: "\(europe!.getFlag())")
                labelCoinName.text = "\(europe!.getCoinName())"
                labelValueTotal.text = "\(europe!.getCoinValueEuro())€"
                imgBg.image = UIImage(named: "\(europe!.getBg())")
                break;
            case 1:
                imgFlag.image = UIImage(named: "\(japan!.getFlag())")
                labelCoinName.text = "\(japan!.getCoinName())"
                labelValueTotal.text = "\(japan!.getCoinValueEuro())¥"
                imgBg.image = UIImage(named: "\(japan!.getBg())")
                break;
            case 2:
                imgFlag.image = UIImage(named: "\(korea!.getFlag())")
                labelCoinName.text = "\(korea!.getCoinName())"
                labelValueTotal.text = "\(korea!.getCoinValueEuro())₩"
                imgBg.image = UIImage(named: "\(korea!.getBg())")
                break;
            default:
                imgFlag.image = UIImage(named: "\(europe!.getFlag())")
                labelCoinName.text = "\(europe!.getCoinName())"
                labelValueTotal.text = "\(europe!.getCoinValueEuro())"
                imgBg.image = UIImage(named: "\(europe!.getBg())")
        }
    }
    
    func interfaceIni(){
        btnConvert.layer.cornerRadius = 10.0
        btnBefore.layer.cornerRadius = 10.0
        btnNext.layer.cornerRadius = 10.0
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    func flagIni(){
        //eu_bg.image = UIImage(named:"eu_bg")
        europe = Flag(flag: "eu_flag", bg: "eu_bg", coinValueEuro: 1.0, coinName: "EURO", coinValueBase: 1.0)
        japan = Flag(flag: "jp_flag", bg: "jp_bg", coinValueEuro: 127.0, coinName: "YEN", coinValueBase: 0.0077)
        korea = Flag(flag: "ko_flag", bg: "ko_bg", coinValueEuro: 1290.53, coinName: "WON", coinValueBase: 0.00078)
    }
}

