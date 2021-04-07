//
//  Calculation.swift
//  calculator
//
//  Created by  Дмитрий Мартынов on 29.03.2021.
//

import Foundation

class Calculator {
    static var shared = Calculator()
    
    var operands = [Int]()
    var lastOperation: Operations?
            
    private init() {}
    
    func calc() -> Int {
                
        let lastIndexOperands = self.operands.count-1
        
        let result = self.lastOperation!.operationFunc(self.operands[lastIndexOperands-1], self.operands[lastIndexOperands])
              
        return result
    }
}

enum Operations: String {
    case plus = "+"
    case minus = "-"
    case multi = "*"
    case div = "/"
    
    var operationFunc: (Int, Int) -> Int {
        
        switch self {
            case .plus:
                return { $0 + $1 }
            case .minus:
                return { $0 - $1 }
            case .multi:
                return { $0 * $1 }
            case .div:
                return { $1 != 0 ? $0 / $1 : 0 }
        }
    }
    
    
}
