//
//  ViewController.swift
//  FoodTrackerExample
//
//  Created by durban.zhang on 2017/5/18.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    // MARK: properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle text filed's user input through delegate callbacks
        mealNameTextField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text";
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyword
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text;
    }

}

