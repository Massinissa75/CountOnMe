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
  
      NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: Notification.Name(rawValue: "notificationsString"), object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(alerteNotif), name: Notification.Name(rawValue: "on ne peut pas l'ajouter !"), object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(alerteNotif), name: .expressionHaveEnoughElement, object: nil)
    }
  
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal)
        else {return}
           calculate.addNumber(numberText)
           textView.text = calculate.operationString
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
     calculate.addOperator(operators: "+")
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calculate.addOperator(operators: "-")
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculate.performCalculate()
       textView.text = calculate.operationString
    }
  
  // updating the text view 
  @objc func updateTextView(){
    textView.text = calculate.operationString
    
  }
  @objc func alerteNotif(){
    let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    self.present(alertVC, animated: true, completion: nil)
  }
}
