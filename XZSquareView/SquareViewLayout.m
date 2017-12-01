//
//  SquareViewLayout.m
//  XZSquareView
//
//  Created by yq on 2017/11/29.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import "SquareViewLayout.h"

//  cell间距
static CGFloat space = 2.f;
@implementation SquareViewLayout

- (NSInteger)col
{
    if (_delegate && [_delegate respondsToSelector:@selector(numberOfCols)]) {
        return [_delegate numberOfCols];
    }
    return 0;
}

- (NSInteger)sum
{
    if (_delegate && [_delegate respondsToSelector:@selector(totalNumbers)]) {
        return [_delegate totalNumbers];
    }
    return 0;
}

- (CGFloat)height
{
    if (_delegate && [_delegate respondsToSelector:@selector(heightOfItems)]) {
        return [_delegate heightOfItems];
    }
    return 0.f;
}

- (CGSize)collectionViewContentSize
{
    if (self.col <= 0) {
        return CGSizeZero;
    }
    NSInteger row = self.sum / self.col + ((self.sum % self.col) > 0 ? 1 : 0);
    CGFloat width = KScreenW;
    CGFloat height = row * self.height;
    return CGSizeMake(width, height);
}

//  该方法用来决定是否需要更新布局。如果collection view需要重新布局返回YES,否则返回NO,默认返回值为NO。子类重载该方法的时候，基于是否collection view的bounds的改变会引发cell和view布局的改变，给出正确的返回值。
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (void)prepareLayout
{
    [super prepareLayout];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [super layoutAttributesForItemAtIndexPath:indexPath];
    if (self.col <= 0) {
        return attr;
    }
    CGFloat itemWidth = (KScreenW-(self.col-1)*space)/self.col;
    CGFloat itemHeight = self.height;
    CGFloat centerX = itemWidth * 0.5 + indexPath.row % self.col * itemWidth + space*(indexPath.row % self.col);
    CGFloat centerY = itemHeight * 0.5 + indexPath.row / self.col * itemHeight + space*(indexPath.row / self.col);
    attr.center = CGPointMake(centerX, centerY);
    attr.size = CGSizeMake(itemWidth, itemHeight);
    attr.indexPath = indexPath;
    return attr;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *arrAttr = [NSMutableArray arrayWithCapacity:6];
    for (NSInteger i = 0; i < array.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [arrAttr addObject:attr];
    }
    return arrAttr;
}

@end
