//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
  
  var operationType = " "
  let calculate = Calculate()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
      NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: .result, object: nil)
     NotificationCenter.default.addObserver(self, selector: #selector(alerteNotif), name: .error, object: nil)
    }
  
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal)
        else {return}
           calculate.addNumber(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
     calculate.addOperator(operators: "+")
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
      calculate.addOperator(operators: "-")
    }

   @IBAction func tappedMultiplyButton(_ sender: Any) {
   
    calculate.addOperator(operators: "*")
   
   }
  
  
   @IBAction func tappedDivideButton(_ sender: Any) {
    
     calculate.addOperator(operators: "/")
   }
  
   @IBAction func tappedEqualButton(_ sender: UIButton) {
        //calculate.reset()
        calculate.performCalculate()
  }
  
  @IBAction func tappedResetButton(_ sender: UIButton) {
   // calculate.reset()
    calculate.operationString = " "
    textView.text = "0"
   // operationType = " "
   
  }
  @IBAction func tappedCommaButton(_ sender: UIButton) {
    calculate.operationString += "."
    
  }
  // updating the text view
  @objc func updateTextView(){
    textView.text = calculate.operationString
    
  }
   @objc func alerteNotif(_ notification: Notification){
      var message = ""
      if let error = notification.userInfo?["error"] as? CalculErrors {
        switch error {
        case .isIncorrect:
          message = " Incorrect expression !"
        case .haventEnoughElement:
          message = "There is no operator !"
        case .alreadyHaveResult:
          message = "The expression already have result !"
        }
      }
      let alertVC = UIAlertController(title: "Zéro!", message: message , preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      self.present(alertVC, animated: true, completion: nil)
    }
}
