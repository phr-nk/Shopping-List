//
//  ViewController.swift
//  LenociF_HW5
//
//  Created by phrank on 2/16/20.
//  Copyright © 2020 phrank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet var textFields: [UITextField]!
    
    var shoppingList:[String] = []
    var inventory:[String: Int] = [:]
    
    var labels = ["Description", "Quantity"]
    
    /**
       *
       * Action for soft ketboard dismal
       *
       * @param: UIButton sender
       * @return: null
       *
       **/
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields
        {
            tf.resignFirstResponder()
        }
        textView.resignFirstResponder()
    }
    /**
    *
    * Action to clear the shopping list
    *
    * @param: UIButton sender
    * @return: null
    *
    **/
    @IBAction func newList(_ sender: UIButton) {
        textView.text = "No Items" //empty current list
        shoppingList.removeAll()
        
    }
    /**
      *
      * Action to clear text inputs
      *
      * @param: UIButton sender
      * @return: null
      *
      **/
    @IBAction func newItem(_ sender: UIButton) {
        for tf in textFields
        {
            tf.resignFirstResponder()
            tf.text = ""
            
        }
    }
    /**
       *
       * Action to add a new item to the list
       *
       * @param: UIButton sender
       * @return: null
       *
       **/
    @IBAction func addItem(_ sender: UIButton) {
        var input: [Int:String] = [:]
        if textView.text == "No Items"
        {
               textView.text = ""
        }
         
        for tf in textFields
        {
            if(tf.text == nil || tf.text == ""){
                validator();
                return
            }
            tf.resignFirstResponder()
            input[tf.tag] = tf.text ?? ""
            shoppingList.append(tf.text ?? ""  )
            
            
        }
        inventory[shoppingList[1]] = Int(shoppingList[0])
        print(inventory)
        let items = "\n x\(shoppingList[0]) \(shoppingList[1])"
        
        shoppingList.removeAll()
      
        textView.text +=  items
    }
    /**
          *
          * When the the user is done editing text
          *
          * @param: UITextField sender
          * @return: null
          *
          **/
    @IBAction func editEned(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    /**
     *
     * Used to validate user input
    *
    * @param: none
    * @return: null
    *
    **/
    func validator(){
        let title = "Incomplete"
        let message = "Please complete the Description and Quantity";
        let alertController =
        UIAlertController(
                            title: title,
                            message: message,
                            preferredStyle: .alert
                         )
        
        let cancelAction =
        UIAlertAction(
                        title: "OK",
                        style: .cancel,
                        handler: nil
                     )
        alertController.addAction(cancelAction)
        present(
                                alertController,
                                animated: true,
                                completion: nil
                             )
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.isEditable = false
        textView.text = "No Items"
        
    }


}

