//
//  WaterfallLayout.swift
//  WaterfallLayout
//
//  Created by yuxiao on 2019/11/15.
//  Copyright © 2019 yuxiao. All rights reserved.
//

import UIKit

public enum WaterfallLayoutCellHeightMode {
    case `static`(height: CGFloat)
    case dynamic
}

public protocol WaterfallLayoutDelegate : NSObjectProtocol {
    func hieghtModeFor(_ indexPath: NSIndexPath,
                       of layout: WaterfallLayout,
                       collectionView: UICollectionView) -> WaterfallLayoutCellHeightMode
}

public class WaterfallLayout: UICollectionViewLayout {
    private var cellAttributes = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight = CGFloat(0)
    weak open var delegate: WaterfallLayoutDelegate?
    
    override public func prepare() {
        super.prepare()
        cellAttributes.removeAll()

        if let collectionView = collectionView,
            let cellCount = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: 0) {
            contentHeight = CGFloat(cellCount * 100)
            for index in 0..<cellCount {
                let att = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: index, section: 0))
                let offsetY = index * 100
                var offsetX = collectionView.bounds.width / 2
                if index.isMultiple(of: 2) {
                    offsetX = 0
                }
                att.frame = CGRect(x: offsetX, y: CGFloat(offsetY), width: collectionView.bounds.width / 2, height: 100)
                cellAttributes.append(att)
            }
        } else {
            contentHeight = 0
        }
    }
    
    override public var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else {
            return .zero
        }
        return CGSize(width: collectionView.bounds.width, height: contentHeight)
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cellAttributes.filter {
            $0.frame.intersects(rect)
        }
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cellAttributes[indexPath.item]
    }
}
