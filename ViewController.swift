//
//  ViewController.swift
//  Search_CollectionView
//
//  Created by Jules on 15/11/26.
//  Copyright © 2015年 YANPANPAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private var _collectionView: UICollectionView!
    private var _layout: CreditDetailListLayout!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        _layout = CreditDetailListLayout()
            
        _collectionView = UICollectionView(frame: self.view.bounds,collectionViewLayout:_layout)
        _collectionView.backgroundColor = UIColor.whiteColor()
        _collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "xx")
        _collectionView.dataSource = self
        _collectionView.delegate = self

        self.view.addSubview(_collectionView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //MARK: UICollectionViewDelegate,UICollectionViewDataSource

    var index: Int = 10
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("xx", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        
        
        var label : UILabel!
        if cell.viewWithTag(index) == nil {
            label = UILabel()
            label.frame = CGRectMake(0, 0, 375, 40)
            label.backgroundColor = UIColor.purpleColor()
            label.tag = index
            cell.addSubview(label)
        } else {
            label = cell.viewWithTag(index) as! UILabel
        }
        label.text = "\(cell.bounds)"        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        print("indexPath---->\(indexPath.section)  \(indexPath.item)")
        return CGSizeMake(375 - 80, 44 + 20 * CGFloat(indexPath.item + indexPath.section))
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 80, 40, 0)
    }
    
}

