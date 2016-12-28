//
//  HMEqualFlowLayout.m
//  MedicalConsult
//
//  Created by minstone on 16/8/23.
//  Copyright © 2016年 minstone. All rights reserved.
//

#import "HMEqualFlowLayout.h"

@implementation HMEqualFlowLayout


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    for (int i = 1; i < attributes.count; i++) {
        // 当前attribute
        UICollectionViewLayoutAttributes *currentAtt = attributes[i];
        // 上一个 attribute
        UICollectionViewLayoutAttributes *preAtt = attributes[i - 1];
        
        // 在同一组内
        if (preAtt.indexPath.section == currentAtt.indexPath.section) {
            // 最大间距
            CGFloat maxSpacing = 15;
            // 前一个 item 的最右边
            CGFloat preMaxX = CGRectGetMaxX(preAtt.frame);
            // 当前的最右边 是否在 collection的范围内，如果不是就换行，否则就在同一行
            // 上一个最大 X 值 + 最大间距 + 当前的宽度 + 缩进 < UIcollection 的 width
            if (preMaxX + maxSpacing + currentAtt.frame.size.width + kNavMargin < self.collectionView.frame.size.width) {// self.collectionViewContentSize.width
                CGRect frame = currentAtt.frame;
                frame.origin.x = preMaxX + maxSpacing;
                currentAtt.frame = frame;
            }
        }
    }
    return attributes;
}
@end
