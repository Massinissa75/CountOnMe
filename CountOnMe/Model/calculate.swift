//
//  calculate.swift
//  CountOnMe
//
//  Created by Massinissa_theking on 01/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

extension Notification.Name {
  static let expressionIsCorrect = Notification.Name("Entrez une expression correcte !")
  static let expressionHaveEnoughElement = Notification.Name("Démarrez un nouveau calcul !")
  static let expressionHaveResult = Notification.Name("completedLengthyDownload")
}


class Calculate {
  
  var operationString: String = "1 + 1 = 2"{
    didSet{
      NotificationCenter.default.post(name: NSNotification.Name(rawValue:"notificationsString"), object: nil)
      
    }
  }
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
    
    guard self.expressionIsCorrect else {
      
      NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Entrez une expression correcte !"), object: nil)
    return
    }
  
    guard self.expressionHaveEnoughElement else {
        
     NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Démarrez un nouveau calcul !"), object: nil)
    return
    }
  
    
    

    
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
  func sendNotification (name: String){
    
    let name = Notification.Name(rawValue: "sendNotification" )
    let notification = Notification(name: name)
    NotificationCenter.default.post(notification)
    
  }
  
  func addOperator(operators: String){
    if canAddOperator {
      switch operators {
         case "+":
            self.operationString += " + "
         case "-":
            self.operationString += " - "
         case "/":
            self.operationString += " / "
         case "*":
            self.operationString += " * "
         default:
            break
      }
    }else{
       NotificationCenter.default.post(name: NSNotification.Name(rawValue:"on ne peut pas l'ajouter !"), object: nil)
    }
  }
}
