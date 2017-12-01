//
//  SquareViewLayout.h
//  XZSquareView
//
//  Created by yq on 2017/11/29.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XZSquareLayoutDelegate <NSObject>

- (NSInteger)numberOfCols;
- (NSInteger)totalNumbers;
- (CGFloat)heightOfItems;

@end

@interface SquareViewLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<XZSquareLayoutDelegate> delegate;
@property (nonatomic, assign) NSInteger col;
@property (nonatomic, assign) NSInteger sum;
@property (nonatomic, assign) CGFloat height;

@end
