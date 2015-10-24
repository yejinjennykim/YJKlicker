//
//  ViewController.swift
//  YJKlicker
//
//  Created by Yejin on 10/24/15.
//  Copyright © 2015 Yejin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var drpdown: UIButton!
    @IBOutlet weak var schoolPicker: UIPickerView!
    var pickerDataSource = ["BU", "SNU"];
    
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
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        drpdown.setTitle(pickerDataSource[row], forState: UIControlState.Normal)
    }
}

