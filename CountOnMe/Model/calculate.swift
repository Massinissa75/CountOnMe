//
//  calculate.swift
//  CountOnMe
//
//  Created by Massinissa_theking on 01/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

extension Notification.Name {
  static let result = Notification.Name("result")
  static let error = Notification.Name("error")
}
enum CalculErrors {
  case isIncorrect, haventEnoughElement, alreadyHaveResult, byZero, operatorIsAlredySet
}
class Calculate {
    var operationString: String = "1 + 1 = 2" {
    didSet {
      NotificationCenter.default.post(name: .result, object: nil)
    }
  }
  var elements: [String] {
    return operationString.split(separator: " ").map { "\($0)" }
  }
  // Error check computed variables
  var expressionIsCorrect: Bool {
    return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
  }
  var expressionHaveEnoughElement: Bool {
    return elements.count >= 3
  }
  var canAddOperator: Bool {
    return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
  }
  var expressionHaveResult: Bool {
    return operationString.firstIndex(of: "=") != nil
  }
  /// add number function:
  func addNumber(_ number: String) {
    if expressionHaveResult {
       operationString = ""
    }
       operationString.append(number)
  }
  func performCalculate() {
    guard self.expressionIsCorrect else {
      NotificationCenter.default.post(name: .error, object: nil, userInfo: ["error": CalculErrors.isIncorrect])
    return
    }
    guard self.expressionHaveEnoughElement else {
      NotificationCenter.default.post(name: .error, object: nil, userInfo: ["error": CalculErrors.haventEnoughElement])
    return
    }
    guard !self.expressionHaveResult else {
      NotificationCenter.default.post(name: .error, object: nil, userInfo: ["error": CalculErrors.alreadyHaveResult])
    return
    }
    // Create local copy of operations
    var operationsToReduce = self.elements
    print(operationsToReduce)
    while operationsToReduce.count > 1 {
    calculatePriorities(&operationsToReduce)
    }
    if operationString != "error"{
    self.operationString.append(" = \(operationsToReduce.first!)")
    }
  }
  /// calculatePriorities depending on operator priority
  /*
   parameter operationsToReduce: inout parameter, list of operations elements
    and operator reduced after the calculation
 */
  func calculatePriorities(_ operationsToReduce: inout [String]) {
  // Iterate over operations while an operand still here
    var count = 1
      if let index = operationsToReduce.firstIndex(where: { $0 == "*" || $0 == "/"}) {
        count = index
      }
        let left = Double(operationsToReduce[count - 1])!
        let operand = operationsToReduce[count]
        let right = Double(operationsToReduce[count + 1 ])!
        var result: Double
          switch operand {
          case "*": result = Double(left * right)
          case "/": result = Double(left / right)
          if right == 0 {
            NotificationCenter.default.post(name: .error, object: nil, userInfo: ["error": CalculErrors.byZero])
            operationString = "Error"
            result = 0
            }
          case "+": result = Double(left + right)
          case "-": result = Double(left - right)
          default:
            NotificationCenter.default.post(name: .error, object: nil,
            userInfo: ["error": CalculErrors.isIncorrect])
            operationString = "error"
            result = 0
          }
          operationsToReduce.remove(at: count)
          operationsToReduce.insert("\(result)", at: count)
          operationsToReduce.remove(at: count - 1)
          operationsToReduce.remove(at: count)
  // print(operationsToReduce)
  }
  func resetValue() {
    self.operationString = ""
  }
  /// add operator function
  func addOperator(operators: String) {
    if expressionHaveResult {
      self.operationString = self.elements.last!
    }
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
            NotificationCenter.default.post(name: .error, object: nil, userInfo: ["error": CalculErrors.isIncorrect])
      }
    } else {
      NotificationCenter.default.post(name: .error, object: nil, userInfo: ["error": CalculErrors.operatorIsAlredySet])
    }
  }
}
