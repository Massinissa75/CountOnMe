//
//  SimpleCalcTests.swift
//  CountOnMeTests
//
//  Created by Massinissa_theking on 18/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {

  var calculate = Calculate()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      super.setUp()
      calculate = Calculate()
      
    }
  
  func testAddOperator(){
    calculate.addNumber("1")
    calculate.addOperator(operators: "+")
    calculate.addNumber("2")
    
    XCTAssert(calculate.canAddOperator)
  
  }
  
  func testSimpleSubstractionOperation(){
    
    calculate.addNumber("10")
    calculate.addOperator(operators: "-")
    calculate.addNumber("2")
    calculate.performCalculate()
    
    XCTAssertEqual(calculate.operationString, "10 - 2 = 8.0")
    XCTAssertEqual(calculate.elements.last!, "8.0")
     
  }
  
  func testSimpleAdditionOperation(){
    
    calculate.addNumber("5")
    calculate.addOperator(operators: "+")
    calculate.addNumber("8")
    calculate.performCalculate()
    XCTAssertEqual(calculate.operationString, "5 + 8 = 13.0")
   
  }
  func testGivenFirstNumberIsTwo_WhenMultiplyingWithNumberThree_ThenResultIsSix() {
    
      calculate.addNumber("2")
      calculate.addOperator(operators: "*")
      calculate.addNumber("3")
      calculate.performCalculate()
      
      XCTAssertEqual(calculate.elements.last!, "6.0")
  }
  func testGivenFirstNumberIsTen_WhenDividingByNumberTwo_ThenResultIsFive() {
      calculate.addNumber("10")
      calculate.addOperator(operators: "/")
      calculate.addNumber("2")
      calculate.performCalculate()
          
      XCTAssertEqual(calculate.elements.last!, "5.0")
  }
  func testGivenFirstNumberIsFour_WhenTappeResetButton_ThenZeroIsDisplayed() {
    calculate.addNumber("4")
    calculate.reset()
    
    XCTAssertEqual(calculate.elements.last!, "0")
  }
}

