//
//  ViewController.swift
//  LenociF_HW5
//
//  Created by phrank on 2/16/20.
//  Copyright © 2020 phrank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textFields: [UITextField]!
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields
        {
            tf.resignFirstResponder()
        }
        
    }
    
    @IBAction func editEned(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

