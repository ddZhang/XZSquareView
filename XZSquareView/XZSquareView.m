//
//  XZSquareView.m
//  XZSquareView
//
//  Created by yq on 2017/11/30.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import "XZSquareView.h"
#import "SquareViewLayout.h"

static NSString *const XZCellID = @"XZCellID";
@interface XZSquareView ()<UICollectionViewDelegate,UICollectionViewDataSource,XZSquareLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XZSquareView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setupViews {
    
    SquareViewLayout *layout = [[SquareViewLayout alloc] init];
    layout.delegate = self;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView setBackgroundColor:[UIColor blackColor]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:XZCellID];
    [self addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_delegate && [_delegate respondsToSelector:@selector(totalNumberOfSquareView:)]) {
        return [_delegate totalNumberOfSquareView:self];
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XZCellID forIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(itemOfSquareView:andRow:)]) {
        for (UIView *view in cell.contentView.subviews) {
            if (view.subviews) {
                [view removeFromSuperview];
            }
        }
        UIView *view = [_delegate itemOfSquareView:self andRow:indexPath.row];
        view.centerX = cell.width / 2;
        view.centerY = cell.height / 2;
        view.tag = indexPath.row;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTap:)];
        [view addGestureRecognizer:tap];
        [cell.contentView addSubview:view];
    }
    return cell;
}

- (NSInteger)numberOfCols {
    
    if (_delegate && [_delegate respondsToSelector:@selector(numberOfColsInSquareView:)]) {
        return [_delegate numberOfColsInSquareView:self];
    }
    return 0;
}

- (NSInteger)totalNumbers {
    
    if (_delegate && [_delegate respondsToSelector:@selector(totalNumberOfSquareView:)]) {
        return [_delegate totalNumberOfSquareView:self];
    }
    return 0;
}

- (CGFloat)heightOfItems {
    
    if (_delegate && [_delegate respondsToSelector:@selector(heightOfItemInSquareView:)]) {
        return [_delegate heightOfItemInSquareView:self];
    }
    return 0;
}

- (void)itemTap:(UITapGestureRecognizer *)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(itemClickedInSquareView:withIndex:)]) {
        [_delegate itemClickedInSquareView:self withIndex:sender.view.tag];
    }
}

@end
