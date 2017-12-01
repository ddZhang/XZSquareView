//
//  XZSquareView.h
//  XZSquareView
//
//  Created by yq on 2017/11/30.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZSquareView;
@protocol XZSquareViewDelegate <NSObject>

- (NSInteger)numberOfColsInSquareView:(XZSquareView *)squareView;
- (NSInteger)totalNumberOfSquareView:(XZSquareView *)squareView;
- (CGFloat)heightOfItemInSquareView:(XZSquareView *)squareView;
- (UIButton *)itemOfSquareView:(XZSquareView *)squareView andRow:(NSInteger)row;
@optional
- (void)itemClickedInSquareView:(XZSquareView *)squareView withIndex:(NSInteger)index;

@end

@interface XZSquareView : UIView

@property (nonatomic, weak) id<XZSquareViewDelegate> delegate;

@end
