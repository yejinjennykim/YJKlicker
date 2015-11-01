//
//  ViewController.swift
//  YJKlicker
//
//  Created by Yejin on 10/24/15.
//  Copyright © 2015 Yejin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var selectSchoolButton: UIButton!
    @IBOutlet weak var schoolPicker: UIPickerView!
    var pickerDataSource = ["BU", "SNU","NEU", "BC", "Harvard"];
    
    @IBOutlet weak var schoolEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad();
        self.schoolPicker.delegate = self;
        self.schoolPicker.dataSource = self;
        schoolPicker.hidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func dropdownClicked(sender: AnyObject) {
        if schoolPicker.hidden {
            schoolPicker.hidden = false;
        } else {
            schoolPicker.hidden = true;
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBOutlet weak var onButtonSubmitClicker: UIButton!

    
    
    @IBAction func onButtonSubmitClicked(sender: AnyObject) {
        //get all the text values of the text fields
        //print the texts
        let email = schoolEmailTextField.text
        let pw = passwordTextField.text
        let pwc = confirmPasswordTextField.text
        func isValidEmail(testStr:String) -> Bool {
            print("validate emilId: \(testStr)")
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluateWithObject(testStr)
            return result
        }
        if isValidEmail(email!) {
            if (pw == pwc) {
                print("Valid Information")
                // TODO: Sign Up Successfully
                performSegueWithIdentifier("segue_signup_success", sender: self)
            }
            else {
                print("Password Confirmation Incorrect")
            }
        }
        else {
            print("Invalid Email")
        }
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectSchoolButton.setTitle(pickerDataSource[row], forState: UIControlState.Normal)
    }
}

