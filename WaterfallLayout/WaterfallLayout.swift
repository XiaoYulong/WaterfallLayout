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
    weak open var delegate: WaterfallLayoutDelegate?
}
