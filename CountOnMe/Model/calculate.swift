//
//  calculate.swift
//  CountOnMe
//
//  Created by Massinissa_theking on 01/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculate {
  
  var operationString: String = "1 + 1 = 2"
  var elements: [String] {
    return operationString.split(separator: " ").map { "\($0)" }
  }
  
  // Error check computed variables
  var expressionIsCorrect: Bool {
    return elements.last != "+" && elements.last != "-"
  }
  
  var expressionHaveEnoughElement: Bool {
    return elements.count >= 3
  }
  
  var canAddOperator: Bool {
    return elements.last != "+" && elements.last != "-"
  }
  
  var expressionHaveResult: Bool {
    return operationString.firstIndex(of: "=") != nil
  }
  
  func addNumber(_ number: String){
   
    if expressionHaveResult {
       operationString = ""
    }
       operationString.append(number)
  }
  func performCalculate(){
    
    // Create local copy of operations
    var operationsToReduce = self.elements
    
    // Iterate over operations while an operand still here
    while operationsToReduce.count > 1 {
      let left = Int(operationsToReduce[0])!
      let operand = operationsToReduce[1]
      let right = Int(operationsToReduce[2])!
      
      let result: Double
      switch operand {
      case "+": result = Double(left + right)
      case "-": result = Double(left - right)
      default: fatalError("Unknown operator !")
      }
      
      operationsToReduce = Array(operationsToReduce.dropFirst(3))
      operationsToReduce.insert("\(result)", at: 0)
    }
    self.operationString.append(" = \(operationsToReduce.first!)")
  }
  
  // notification
  func addOperator(_ operator: String){
    
    let name = Notification.Name(rawValue: "operation" )
    let notification = Notification(name: name)
    NotificationCenter.default.post(notification)
    
    if self.canAddOperator {
       self.operationString.append(" + ")
     
    } else {
      //let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
      //alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      //self.present(alertVC, animated: true, completion: nil)
    }
  }
}
