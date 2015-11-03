//
//  ClickerViewController.swift
//  YJKlicker
//
//  Created by JeeWan Gue on 11/1/15.
//  Copyright © 2015 Yejin. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var clickerButtonCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickerButtonCollection.dataSource = self
        clickerButtonCollection.delegate = self
        clickerButtonCollection.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let i = collectionView.dequeueReusableCellWithReuseIdentifier("clickerCell", forIndexPath: indexPath) as UICollectionViewCell!
        return i
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
