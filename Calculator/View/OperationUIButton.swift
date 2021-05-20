//
//  OperationUIButton.swift
//  Calculator
//
//  Created by mdy on 09.04.2021.
//

import UIKit

public protocol SelectButtonDelegate: class {
    func selectButton(_ tagButton: Int)
}

public class OperationUIButton: UIButton {
    
    //var main: MainViewController?
    
    var operation: Operations?
    
    
    var imgStr: String?
    
    public func selectButton(_ tagButton: Int) {
        
        let img = UIImage(systemName: "divide.square" + ".fill")
        self.setBackgroundImage(img, for: .normal)

    }
    
}


class OperationDivUIButton: OperationUIButton {
         
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.operation = Operations.div
        self.imgStr = "divide.square"
    }
}




