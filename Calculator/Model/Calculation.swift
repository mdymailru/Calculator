//
//  Calculation.swift
//  calculator
//
//  Created by  Дмитрий Мартынов on 29.03.2021.
//

import Foundation

public protocol CalculatorDelegate: class {
    var maxDigit: Int { get } // максимальное количество знаков на табло для операнда
    
    func addNewOperation(_ tagOfOperation: Int) -> Bool
    func addNewOperand(_ newOperand: String) -> Bool
    func calc() -> Int?
}

class Calculator: CalculatorDelegate {
    
    //static var shared = Calculator()
    
    let maxDigit = 16 // максимальное количество знаков на табло для операнда
    
    private var operands = [Int]()
    private var lastOperation: Operations?
    
            
    //init() {}
    
    func addNewOperand(_ operandFromView: String) -> Bool {
        guard let newOperand = Int(operandFromView) else { return false }
            
        self.operands.insert(newOperand, at: 0)
        // debug
            let countOperands = self.operands.count
            print("\(countOperands):\(self.operands[0])")
        // end debug
        return true
    }
    
    func addNewOperation(_ tagOfOperation: Int) -> Bool {
        guard let operation = Operations(rawValue: tagOfOperation) else { return false }
        
        self.lastOperation = operation
        // debug
            print(operation)
        // end debug
        return true
    }
    
    func calc() -> Int? {
        guard let operation = self.lastOperation,
              self.operands.count > 1 else { return nil }
              
        let result = operation.operationProp.calc(self.operands[1], self.operands[0])
        // debug
            print("Calc: \(result)")
        // end debug
        return result
    }
}

public enum Operations: Int {
    case plus = 100 // "+"
    case minus = 200 // "-"
    case multi = 300 // "*"
    case div = 400 // "/"
    
    var operationProp: (img: String, calc: (Int, Int) -> Int) {
        
        switch self {
            case .plus:
                return ("plus.square", { $0 + $1 })
            case .minus:
                return ("minus.square", { $0 - $1 })
            case .multi:
                return ("multiply.square", { $0 * $1 })
            case .div:
                return ("divide.square", { $1 != 0 ? $0 / $1 : 0 })
        }
    }
}


