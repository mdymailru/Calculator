//
//  ViewController.swift
//  Calculator
//
//  Created by mdy on 07.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak private var tabloLabel: UILabel!
    
    private let calc = Calculator.shared
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func touchNumPad(_ sender: UIButton) {
        if let text = tabloLabel.text {
            tabloLabel.text =  (text != "0" ? text : "") + String(sender.tag)
        } else {
            tabloLabel.text = String(sender.tag)
        }
    }
    
    @IBAction func cleanTabloTouch(_ sender: UIButton) {
        tabloLabel.text = "0"
    }
}

