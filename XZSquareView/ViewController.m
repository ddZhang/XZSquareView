//
//  ViewController.m
//  XZSquareView
//
//  Created by yq on 2017/11/28.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import "ViewController.h"
#import "XZSquareView.h"

@interface ViewController ()<XZSquareViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    XZSquareView *view = [[XZSquareView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 300)];
    view.delegate = self;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)heightOfItemInSquareView:(XZSquareView *)squareView {
    
    return 100;
}

- (UIView *)itemOfSquareView:(XZSquareView *)squareView andRow:(NSInteger)row {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 3, 100)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}

- (NSInteger)numberOfColsInSquareView:(XZSquareView *)squareView {
    
    return 3;
}

- (NSInteger)totalNumberOfSquareView:(XZSquareView *)squareView {
    
    return 9;
}

- (void)itemClickedInSquareView:(XZSquareView *)squareView withIndex:(NSInteger)index
{
    NSLog(@"tap on : %li",index);
}

@end
