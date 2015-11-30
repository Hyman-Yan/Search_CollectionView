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
    private var _sectionEdgeInset: [UIEdgeInsets] = []
    private var _itemEdgeInset: [NSIndexPath:UIEdgeInsets] = [:]
    
    private var _detailCount: Int = 0
    
    private var _itemAttributes: [NSIndexPath:UICollectionViewLayoutAttributes] = [:]
    private var _headersAttributes: [UICollectionViewLayoutAttributes] = []
    private var _footersAttributes: [UICollectionViewLayoutAttributes] = []
    
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
        
        let collectionView = self.collectionView
        let width = (collectionView?.bounds.width)!
        var headerY: CGFloat = 0
        
        for section in 0...1 {
        
            //Header
            //选项卡header
            var headerHeight: CGFloat = 0
            if section == 1 {
                headerHeight = 80
            }
            
            let layoutAtt = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind:kHeaderLayoutAttribute, withIndexPath: NSIndexPath(forItem: 0, inSection: 1))
            layoutAtt.frame = CGRectMake(0, headerY, width, headerHeight)
            _headersAttributes.append(layoutAtt)
            
            //Item
            //卡片信息layout
            var layoutAtt_0 : UICollectionViewLayoutAttributes!
            
            for(var idx = 0; idx < _detailCount; idx++) {
                let indexPath = NSIndexPath(forItem: idx, inSection: 1)
                layoutAtt_0 = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                
                //普通cell
                layoutAtt_0.size = CGSizeMake(width, 50)
                _itemAttributes[indexPath] = layoutAtt_0
                
                switch _detailType! {
                    
                case .Money:
                    layoutAtt.size = CGSizeMake(width, 50 )
                    
                    break
                case .Credit:
                    break
                case .SupportOilStation:
                    break
                    
                }
                
                
            }
            _currentHeight = CGRectGetMaxY(layoutAtt_0.frame)
            
            //Footer
        }
    }
    
    deinit {
    }
    
    
    override func collectionViewContentSize() -> CGSize {
        
        print(_currentHeight)
        
        return CGSizeMake(self.collectionView!.frame.width, _currentHeight)
    }
    
//    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return _itemAttributes
//    }
    
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
