# XZSquareView
对9宫格视图封装，代理传递列数，单元数，自定义的cell单元

主要就2个类：

XZSquareView：管理collectionView
SquareViewLayout：继承于UICollectionViewFlowLayout，管理collectionView布局

使用

```
//初始化frame
XZSquareView *view = [[XZSquareView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 300)];

//实现以下代理

//单元格高度
- (CGFloat)heightOfItemInSquareView:(XZSquareView *)squareView;
//传入自定义单元格
- (UIView *)itemOfSquareView:(XZSquareView *)squareView andRow:(NSInteger)row;

- (NSInteger)numberOfColsInSquareView:(XZSquareView *)squareView;

- (NSInteger)totalNumberOfSquareView:(XZSquareView *)squareView;

- (void)itemClickedInSquareView:(XZSquareView *)squareView withIndex:(NSInteger)index;

```
