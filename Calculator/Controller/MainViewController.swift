//
//  ViewController.swift
//  Calculator
//
//  Created by mdy on 07.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak private var tabloLabel: UILabel!
    
    //private let calc = Calculator.shared
    private var calcDelegate: CalculatorDelegate?
    weak var operBatton: SelectButtonDelegate?
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        calcDelegate = Calculator()
       
    }

    @IBAction func numPadTouch(_ sender: UIButton) {
        let text = tabloLabel.text ?? ""
        guard let maxTablo = calcDelegate?.maxDigit,
              text.count < maxTablo else { return }
        
        tabloLabel.text =  (text != "0" ? text : "") + String(sender.tag)
    }
    
    @IBAction func cleanTabloTouch(_ sender: UIButton) {
        tabloLabel.text = "0"
    }
    
    @IBAction func operationTouch(_ sender: UIButton) {
        guard let tabloText = tabloLabel.text,
              let _ = calcDelegate?.addNewOperand(tabloText),
              let _ = calcDelegate?.addNewOperation(sender.tag)
        else { return }
        
        tabloLabel.text = nil
        
        
    }
    
    @IBAction func resultTouch(_ sender: UIButton) {
        guard let tabloText = tabloLabel.text,
              let _ = calcDelegate?.addNewOperand(tabloText),
              let result = calcDelegate?.calc() else { return }
    
        tabloLabel.text = String(result)
    }
}

