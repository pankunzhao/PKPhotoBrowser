//
//  PKPhotoHDViewController.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKPhotoHDViewController.h"
#import "PKImageBrowserFlowLayout.h"
#import "PKPhotoBrowserPageControl.h"
#import "PKPhotoBrowserConfig.h"
#import "PKHDImgCell.h"
#import "SDImageCacheConfig.h"


#define kCellIdentifier @"cell"
@interface PKPhotoHDViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) PKImageBrowserFlowLayout* flowLayout;
@property (nonatomic,strong) UICollectionView* collectionView;
@property (nonatomic,strong) PKPhotoBrowserPageControl* pageControl;

@property (nonatomic,strong) UIImageView *screenShotImgV;


@end

@implementation PKPhotoHDViewController

#pragma mark -lift

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.screenShotImgV];
    [self.screenShotImgV addSubview:self.collectionView];
    [self.view addSubview:self.pageControl];

}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //设置 进来后显示的Cell
    [self.collectionView setContentOffset:
     CGPointMake(self.currentIndex * kImageBrowserWidth, 0.0f) animated:NO];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.HDImgsUrl.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PKHDImgCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier
                                                                         forIndexPath:indexPath];
    
    
    
    __weak typeof(self) weakself = self;
    [cell configCellWithHDUrl:self.HDImgsUrl[indexPath.row]
                     thumbImg:self.thumbImgs[indexPath.row]
                    index:(int)indexPath.row tapBlock:^(UIImageView *imagV, int index) {
                        
                        weakself.screenShotImgV.image = weakself.screenshot;
            
                        //返回退出该控制器
                        CGFloat appvieww= thumbImg_W * CoefficientThumbImgV(self.view.bounds.size.width);
                        [UIView animateWithDuration:0.3 animations:^{
                            
                            
                            NSString *pointStr = weakself.thumbFrames[indexPath.row];
                            CGPoint point = CGPointFromString(pointStr);
                            
                            imagV.frame = CGRectMake(point.x - 6, point.y - 9, appvieww, appvieww);
                            
                        } completion:^(BOOL finished) {
                            [weakself dismissViewControllerAnimated:NO completion:^{
                                
                            }];
                        }];

                    }
                   longPressBlock:^(UIImageView *imagV, UIGestureRecognizerState longPressState,BOOL isExitHD) {
                        if(longPressState == UIGestureRecognizerStateBegan ||
                           longPressState == UIGestureRecognizerStateChanged )
                        {
                            if(weakself.screenShotImgV.image == weakself.screenshot)
                                return ;
                            
                            weakself.screenShotImgV.image = weakself.screenshot;
                        }
                       else if(longPressState == UIGestureRecognizerStateEnded && isExitHD == NO)
                       {
                           weakself.screenShotImgV.image = nil;
                       }
                       else if(longPressState == UIGestureRecognizerStateEnded && isExitHD == YES)
                       {
                           weakself.screenShotImgV.image = weakself.screenshot;
                           //返回退出该控制器
                           [weakself dismissViewControllerAnimated:NO completion:^{
                               
                           }];
                       }
                   }];
    return cell;
}

#pragma mark scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    
    //获取当前 位置
    CGFloat offsetX = scrollView.contentOffset.x;
    
    int index = offsetX/SCREEN_WIDTH;
    
    self.currentIndex = index;
}


#pragma mark - lazy

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]
                           initWithFrame:CGRectMake(0,
                                                    0,
                                                    kImageBrowserWidth,
                                                    self.view.bounds.size.height)
                           collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[PKHDImgCell class]
            forCellWithReuseIdentifier:kCellIdentifier];
    }
    return _collectionView;
}

- (PKImageBrowserFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[PKImageBrowserFlowLayout alloc] init];
    }
    return _flowLayout;
}


- (PKPhotoBrowserPageControl *)pageControl
{
    if(_pageControl == nil)
    {
        _pageControl = [[PKPhotoBrowserPageControl alloc]initWithPageNum:self.HDImgsUrl.count currentPage:_currentIndex];
        
    }
    return _pageControl;
}


- (void)setCurrentIndex:(int)currentIndex
{
    _currentIndex = currentIndex;
    self.pageControl.currentPage = _currentIndex;
}


- (UIImageView *)screenShotImgV
{
    if(!_screenShotImgV)
    {
        _screenShotImgV = [[UIImageView alloc]init];
        _screenShotImgV.userInteractionEnabled = YES;
        _screenShotImgV.frame = self.view.bounds;
        //_screenShotImgV.image = self.screenshot;
       // _screenShotImgV.backgroundColor = [UIColor blackColor];
    }
    
    return _screenShotImgV;
}



@end
