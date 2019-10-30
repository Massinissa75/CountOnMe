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
  func testAddOperatorPlus() {
    calculate.addNumber("1")
    calculate.addOperator(operators: "+")
    calculate.addNumber("2")
    XCTAssert(calculate.canAddOperator)
  }
  func testAddOperatorMultipl() {
    calculate.addNumber("15")
    calculate.addOperator(operators: "-")
    calculate.addNumber("3")
    calculate.addOperator(operators: "+")
    calculate.addNumber("2")
    calculate.addOperator(operators: "*")
    calculate.addNumber("2")
    calculate.addOperator(operators: "/")
    calculate.addNumber("3")
    XCTAssert(calculate.canAddOperator)
  }
  func testAddOperatorMultiply() {
    calculate.addNumber("4")
    calculate.addOperator(operators: "*")
    calculate.addNumber("4")
    XCTAssert(calculate.canAddOperator)
  }
  func testAddOperatorDivide() {
    calculate.addNumber("18")
    calculate.addOperator(operators: "/")
    calculate.addNumber("3")
    XCTAssert(calculate.canAddOperator)
  }
  func testSimpleSubstractionOperation() {
    calculate.addNumber("10")
    calculate.addOperator(operators: "-")
    calculate.addNumber("2")
    calculate.performCalculate()
    XCTAssertEqual(calculate.operationString, "10 - 2 = 8.0")
    XCTAssertEqual(calculate.elements.last!, "8.0")
  }
  func testSimpleAdditionOperation() {
    calculate.addNumber("5")
    calculate.addOperator(operators: "+")
    calculate.addNumber("8")
    calculate.performCalculate()
    XCTAssertEqual(calculate.operationString, "5 + 8 = 13.0")
  }
  func testOperatorOperation() {
     calculate.addNumber("5")
     calculate.addOperator(operators: "+")
     calculate.addNumber("8")
     calculate.addOperator(operators: "-")
     calculate.addNumber("2")
     calculate.performCalculate()
     XCTAssertEqual(calculate.operationString, "5 + 8 - 2 = 11.0")
     XCTAssertEqual(calculate.elements.last!, "11.0")
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
    calculate.resetValue()
    XCTAssertEqual(calculate.operationString, "")
  }
  func testGivenFirstNumberIsFour_WhenAddingNumberTwoAndMultiplyingWithNumberThree_ThenResultIsTen() {
    calculate.addNumber("4")
    calculate.addOperator(operators: "+")
    calculate.addNumber("2")
    calculate.addOperator(operators: "*")
    calculate.addNumber("3")
    calculate.performCalculate()
    XCTAssertEqual(calculate.elements.last!, "10.0")
  }
  func testGivenFirstNumberIsFive_WhenDividingWithNumberTwo_ThenResultIsTwoDateFive() {
       calculate.addNumber("5")
       calculate.addOperator(operators: "/")
       calculate.addNumber("2")
       calculate.performCalculate()
       XCTAssertEqual(calculate.elements.last!, "2.5")
  }
  func testGivenFirstNumberIsSevenDateFive_WhenDividingWithNumberTwo_ThenResultIsFifteen() {
        calculate.addNumber("7.5")
        calculate.addOperator(operators: "*")
        calculate.addNumber("2")
        calculate.performCalculate()
        XCTAssertEqual(calculate.elements.last!, "15.0")
  }
  func testGivenFirstNumberIsSix_WhenAddingNumberTwoAndMultiplyByFive_ThenResultIsSixteen() {
        calculate.addNumber("6")
        calculate.addOperator(operators: "+")
        calculate.addNumber("2")
        calculate.addOperator(operators: "*")
        calculate.addNumber("5")
        calculate.performCalculate()
        XCTAssertEqual(calculate.elements.last!, "16.0")
  }
  func testGivenFirstNumberIsOne_WhenSubstractNumberTwoAndAddingNumberThreeAndMultiplyingByTwo_ThenResultIsFive() {
        calculate.addNumber("1")
        calculate.addOperator(operators: "-")
        calculate.addNumber("2")
        calculate.addOperator(operators: "+")
        calculate.addNumber("3")
        calculate.addOperator(operators: "*")
        calculate.addNumber("2")
        calculate.performCalculate()
        XCTAssertEqual(calculate.elements.last!, "5.0")
  }
  func testGivenAddOperatorWhenAddAnotherOperatorthenGetError() {
        calculate.addNumber("10")
        calculate.addOperator(operators: "+")
        calculate.addOperator(operators: "-")
    let error = calculate.expressionIsCorrect
        XCTAssertFalse(error)
  }
  func testGiveExpressionOKWhenCheckThenReturnIsTrue() {
        calculate.addNumber("9")
        calculate.addOperator(operators: "-")
        calculate.addNumber("5")
        calculate.addOperator(operators: "+")
        calculate.addNumber("2")
    let test = calculate.expressionIsCorrect
        XCTAssertTrue(test)
  }
  func testGiveExpressionHaveEnoughElementWhenCheckThenReturnIsTrue() {
      calculate.addNumber("11")
      calculate.addOperator(operators: "-")
      calculate.addNumber("2")
      calculate.addOperator(operators: "+")
      calculate.addNumber("5")
    let enough = calculate.expressionHaveEnoughElement
      XCTAssertTrue(enough)
  }
  func testGivenAddOperatorWhenAddAnotherNumberThenExpressionIsCorrectIsTrue() {
        calculate.addNumber("10")
        calculate.addOperator(operators: "+")
        calculate.addNumber("5")
    let isOk = calculate.expressionIsCorrect
        XCTAssertTrue(isOk)
  }
 func testGivenAddOperatorWhenAddAnotherNumberThenExpressionHaveResultIsTrue() {
      calculate.addNumber("8")
      calculate.addOperator(operators: "+")
      calculate.addNumber("2")
      calculate.performCalculate()
  let haveResult = calculate.expressionHaveResult
      XCTAssertTrue(haveResult)
  }
  func testPriorities() {
         calculate.addNumber("6")
         calculate.addOperator(operators: "+")
         calculate.addNumber("2")
         calculate.addOperator(operators: "*")
         calculate.addNumber("5")
         calculate.addOperator(operators: "-")
         calculate.addNumber("2")
         calculate.addOperator(operators: "/")
         calculate.addNumber("2")
         calculate.performCalculate()
         XCTAssertEqual(calculate.elements.last!, "15.0")
   }
  func testGivenOperationString_WhenDivisionByZeroAndCalculatePriorities_ThenHaveAnError() {
    var operationsToReduce = ["4", "/", "0", "+", "9"]
        calculate.calculatePriorities(&operationsToReduce)
    XCTAssertEqual(operationsToReduce, ["0.0", "+", "9"])
    XCTAssertEqual(calculate.operationString, "error")
  }
  func testGivenOperationStringWithAknownOperatio_WhenDivisionByZeroAndCalculatePriorities_ThenHaveAnError() {
     var operationsToReduce = ["4", "m", "0", "+", "9"]
         calculate.calculatePriorities(&operationsToReduce)
     XCTAssertEqual(operationsToReduce, ["0.0", "+", "9"])
     XCTAssertEqual(calculate.operationString, "error")
   }
  func testGivenOperationStringWithNumberAndNoOperator_WhenDivisionByZeroAndCalculatePriorities_ThenHaveAnError() {
    var operationsToReduce = ["4", "2", "0", "+", "9"]
        calculate.calculatePriorities(&operationsToReduce)
    XCTAssertEqual(operationsToReduce, ["0.0", "+", "9"])
    XCTAssertEqual(calculate.operationString, "error")
  }
  func testNotificationAddOperator() {
    expectation(forNotification: NSNotification.Name(rawValue: "error"), object: nil, handler: nil)
    calculate.operationString = "3 + 2"
    calculate.addOperator(operators: "r")
    waitForExpectations(timeout: 0.1, handler: nil)
  }
  func testNotificationExpressionHaveResult() {
    expectation(forNotification: NSNotification.Name(rawValue: "error"), object: nil, handler: nil)
    calculate.operationString = "3 + 2 = 5"
    calculate.performCalculate()
    waitForExpectations(timeout: 0.1, handler: nil)
  }
  func testNotificationExpressionIsCorrect() {
    expectation(forNotification: NSNotification.Name(rawValue: "error"), object: nil, handler: nil)
    calculate.operationString = "3 + 2 +"
    calculate.performCalculate()
    waitForExpectations(timeout: 0.1, handler: nil)
  }
  func testNotificationExpressionHaveEnoughElement() {
    expectation(forNotification: NSNotification.Name(rawValue: "error"), object: nil, handler: nil)
    calculate.operationString = "3 ="
    calculate.performCalculate()
    waitForExpectations(timeout: 0.1, handler: nil)
  }
  func testNotificationAddOperator2() {
    expectation(forNotification: NSNotification.Name(rawValue: "error"), object: nil, handler: nil)
    calculate.operationString = "3 + 2 = 5"
    calculate.addOperator(operators: "+")
    calculate.performCalculate()
    waitForExpectations(timeout: 0.1, handler: nil)
  }
}
