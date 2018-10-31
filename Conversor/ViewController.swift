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

class ViewController: UIViewController {

    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var pickerViewCoin: UIPickerView!
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceIni()
        flagIni()
    }
    @IBAction func onNextClick(_ sender: Any) {
        imgFlag.image = UIImage(named: "\(japan?.getFlag())")

        //imgFlag.image = UIImage(named: "jp_flag")
    }
    
    func interfaceIni(){
        btnConvert.layer.cornerRadius = 10.0
        btnBefore.layer.cornerRadius = 10.0
        btnNext.layer.cornerRadius = 10.0
    }
    func flagIni(){
        //eu_bg.image = UIImage(named:"eu_bg")
        europe = Flag(flag: "eu_flag", bg: "eu_bg", coinValue: 1.0)
        japan = Flag(flag: "jp_flag", bg: "jp_bg", coinValue: 127.0)
        korea = Flag(flag: "ko_flag", bg: "ko_bg", coinValue: 1290.53)
    }
}

