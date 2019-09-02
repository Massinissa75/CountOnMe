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
  
  func addition(_number: String){

    if canAddOperator {
       operationString.append(" + ")
    }
  }
}
