//
//  ViewController.swift
//  YJKlicker
//
//  Created by Yejin on 10/24/15.
//  Copyright © 2015 Yejin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate {


    @IBOutlet weak var searchSchool: UISearchBar!
    @IBOutlet weak var selectSchoolButton: UIButton!
    @IBOutlet weak var schoolPicker: UIPickerView!
    @IBOutlet weak var schoolPickerHeightConstraint: NSLayoutConstraint!

    var pickerDataSource = ["BU", "SNU","NEU", "BC", "Harvard"]
    
    @IBOutlet weak var schoolEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad();
        self.schoolPicker.delegate = self
        self.schoolPicker.dataSource = self
        schoolPicker.alpha = 0.0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*
    * Search Bar Delegate
    */
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        print("search start")
//        schoolPicker.fadeIn()

        UIView.animateWithDuration(1.0, animations: {
            self.schoolPickerHeightConstraint.constant = 400
            self.schoolPicker.transform = CGAffineTransformIdentity
            self.schoolPicker.alpha = 1.0
            self.searchSchool.alpha = 1.0
            self.view.layoutIfNeeded()
        })
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // Using Fuzzy String Search
        let similarity = pickerDataSource.map({ $0.score(word: searchText, fuzziness: 0.5) })
        print(similarity)
        if let f = similarity.maxElement() {
            if f > 0 {
                if let idx = similarity.indexOf(f) {
                    print(pickerDataSource[idx])
                    schoolPicker.selectRow(idx, inComponent: 0, animated: true)
                }
            }
        }
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        print("search end")
//        schoolPicker.fadeOut()
        
        UIView.animateWithDuration(1.0, animations: {
            self.schoolPickerHeightConstraint.constant = 0
            self.schoolPicker.transform = CGAffineTransformMakeScale(1, 0)
            self.schoolPicker.alpha = 0
            self.searchSchool.alpha = 0.3
            self.view.layoutIfNeeded()
        })
    }
    
    /*
    * Picker View Delegate
    */
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
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
                self.view.makeToast(message: "Password Mismatch")
            }
        }
        else {
            print("Invalid Email")
            self.view.makeToast(message: "Invalid Email")
        }
    }
}

