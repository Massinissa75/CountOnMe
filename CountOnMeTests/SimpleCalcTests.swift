//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe


class SimpleCalcTests: XCTestCase {

    var calculate = Calculate()
 

    override func setUp() {
      calculate = Calculate()
      
    }

  func testAddOperato() {
    calculate.addNumber("2")
    calculate.addOperator(operators: "+")
    calculate.addNumber("4")
    
    XCTAssertEqual(calculate.operationString, "6")
  }

}
