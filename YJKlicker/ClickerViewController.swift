//
//  ClickerViewController.swift
//  YJKlicker
//
//  Created by JeeWan Gue on 11/1/15.
//  Copyright © 2015 Yejin. All rights reserved.
//

import UIKit
import JLToast

class ClickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let toastDuration: NSTimeInterval = 3.0
        let toast_hi = JLToast.makeText("Hello (Name)", duration: toastDuration)
        toast_hi.show()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
