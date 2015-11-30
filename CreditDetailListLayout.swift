//
//  CreditDetailListLayout.swift
//  weicheche
//
//  Created by Jules on 15/11/30.
//  Copyright © 2015年 WeiCheKeJi. All rights reserved.
//

import UIKit

let kHeaderLayoutAttribute = "kHeaderLayoutAttribute"

enum VIPCardDetailType {

    case Credit
    case SupportOilStation
    case Money

}

class CreditDetailListLayout: UICollectionViewLayout {
    
    // MARK: - Assist Variable
    private var _currentHeight: CGFloat = 0
    private var _sectionEdgeInset: [Int:UIEdgeInsets] = [:]
    private var _itemEdgeInset: [NSIndexPath:UIEdgeInsets] = [:]
    
    private var _detailCount: Int = 0
    
    private var _itemAttributes: [NSIndexPath:UICollectionViewLayoutAttributes] = [:]
    private var _headersAttributes: [NSIndexPath:UICollectionViewLayoutAttributes] = [:]
    private var _footersAttributes: [NSIndexPath:UICollectionViewLayoutAttributes] = [:]
    
    private var _detailType : VIPCardDetailType!
    
//    private var
    
    // MARK: - Load
    
    override init() {
        super.init()
        _detailCount = 2
        _detailType = .Money
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareLayout() {
        super.prepareLayout()
        
        _headersAttributes.removeAll()
        _itemAttributes.removeAll()
        _currentHeight = 0
        _sectionEdgeInset = [
            0:UIEdgeInsetsMake(10, 0, 10, 0),
            1:UIEdgeInsetsMake(10, 0, 10, 0)
        ]
        
        _itemEdgeInset = [
            NSIndexPath(forItem: 0, inSection: 0): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 1, inSection: 0): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 0, inSection: 1): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 1, inSection: 1): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 0, inSection: 2): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 1, inSection: 2): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 0, inSection: 3): UIEdgeInsetsMake(10, 0, 10, 0),
            NSIndexPath(forItem: 1, inSection: 3): UIEdgeInsetsMake(10, 0, 10, 0),
        ]
        
        let collectionView = self.collectionView
        let width = (collectionView?.bounds.width)!
        var top: CGFloat = 0
        
        for section in 0...1 {
        

            //Header
            //选项卡header
            var headerHeight: CGFloat = 0
            if section == 1 {
                headerHeight = 80
            }
            let headerIndexPath = NSIndexPath(forItem: 0, inSection: section)
            let layoutAtt = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind:kHeaderLayoutAttribute, withIndexPath: headerIndexPath)
            
            top += _sectionEdgeInset[section]!.top
            
            layoutAtt.frame = CGRectMake(0, top, width, headerHeight)
            _headersAttributes[headerIndexPath] = layoutAtt
            top = CGRectGetMaxY(layoutAtt.frame) + _itemEdgeInset[headerIndexPath]!.bottom
            //Item
            //卡片信息layout
            var layoutAtt_0 : UICollectionViewLayoutAttributes!
            
            for(var idx = 0; idx < _detailCount; idx++) {
                let indexPath = NSIndexPath(forItem: idx, inSection: 1)
                layoutAtt_0 = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                
                top += _itemEdgeInset[indexPath]!.top
                
                //普通cell
                layoutAtt_0.size = CGSizeMake(width, 50)
                _itemAttributes[indexPath] = layoutAtt_0
                
                switch _detailType! {
                    
                case .Money:
                    layoutAtt.frame = CGRectMake(0, top, width, 50)
                    
                    break
                case .Credit:
                    break
                case .SupportOilStation:
                    break
                    
                }
                
                top += _itemEdgeInset[indexPath]!.bottom
            }
            
            top += _sectionEdgeInset[section]!.bottom
            
            _currentHeight = top
            
            //Footer
        }
    }
    
    deinit {
    }
    
    
    override func collectionViewContentSize() -> CGSize {
        
        self.collectionView?.backgroundView?.backgroundColor = UIColor.yellowColor()
        
        let rct = CGSizeMake(self.collectionView!.frame.width, _currentHeight)
        print(rct)
        return CGSizeMake(self.collectionView!.frame.width, _currentHeight)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let values = Array(_itemAttributes.values)
        return values
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return _itemAttributes[indexPath]
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    // MARK: - Private Method
    
    
    
    
    
    
    
    // MARK: - IBActions
    
    
    
    // MARK: - Outer Interface
    //==============对外开放接口=====================
    

    
}
