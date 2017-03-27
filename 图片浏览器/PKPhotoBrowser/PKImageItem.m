//
//  PKImageItem.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKImageItem.h"
#import "PKPhotoBrowserConfig.h"
#import "UIImageView+WebCache.h"
#import <Photos/Photos.h>


//1、图片缩放必须实现UIScrollViewDelegate的这两个方法：viewForZoomingInScrollView和 scrollViewDidEndZooming:withView:atScale:。
//
//2、设置最大、最小缩放比，maxinumZoomScale、mininumZoomScale。

const CGFloat kMaximumZoomScale = 3.0f;
const CGFloat kMinimumZoomScale = 1.0f;
const CGFloat kDuration = 0.3f;

@interface PKImageItem () <UIScrollViewDelegate>

//获取block

@property (nonatomic, copy) tapImgVBlock tapBlock;
@property (nonatomic, copy) longPressImgVBlock longPressblock;

@property (nonatomic, assign) CGRect recordOrgFrame;

@property (nonatomic, assign) int index;
@property (nonatomic, assign) CGFloat alpha;

//控制 手势区别
@property (nonatomic, assign)BOOL isLongPress;


@end

@implementation PKImageItem


#pragma mark -lift
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.alpha = 1.0;
        self.isLongPress = YES;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.maximumZoomScale = kMaximumZoomScale;
        self.minimumZoomScale = kMinimumZoomScale;
        self.zoomScale = 1.0f;
        self.backgroundColor = RGB(0, 0, 0, 1);
        [self addSubview:self.imageView];
        [self setupGestures];
    }
    return self;
}



- (void)configHDImageItem:(NSString *)urlStr
               thumbImage:(UIImage *)thumgImage
                    index:(int) index
                 tapBlock:(tapImgVBlock) block
                longPress:(longPressImgVBlock) longPressBlock;
{

    CGRect destinationRect = [self calculateDestinationFrameWithSize:thumgImage.size];
    
    self.imageView.frame = destinationRect;
    self.recordOrgFrame = self.imageView.frame;
    
    self.tapBlock = block;
    self.longPressblock = longPressBlock;
    self.index = index;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
}



#pragma mark - private

- (void)setupGestures {
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleSingleTap:)];
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer* twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                   action:@selector(handleTwoFingerTap:)];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressTap:)];
    
    
    
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    doubleTap.numberOfTapsRequired = 2;
    twoFingerTap.numberOfTouchesRequired = 2;
    longPress.minimumPressDuration = 0.3;
    
    [self addGestureRecognizer:singleTap];
    [self.imageView addGestureRecognizer:doubleTap];
    [self.imageView addGestureRecognizer:twoFingerTap];
    [self.imageView addGestureRecognizer:longPress];
    [singleTap requireGestureRecognizerToFail:doubleTap];
}


- (CGRect)calculateDestinationFrameWithSize:(CGSize)size{
    CGRect rect;
    rect = CGRectMake(0.0f,
                      (SCREEN_HEIGHT - size.height * SCREEN_WIDTH/size.width)/2,
                      SCREEN_WIDTH,
                      size.height * SCREEN_WIDTH/size.width);
    if (rect.size.height > SCREEN_HEIGHT) {
        rect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    }
    self.contentSize = rect.size;
    return rect;
}



#pragma mark - UIGestureRecognizerHandler

- (void)handleSingleTap:(UITapGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.numberOfTapsRequired == 1) {
        
        self.isLongPress = YES;
        self.backgroundColor = [UIColor clearColor];
        
            if(_tapBlock)
            {
                _tapBlock(self.imageView,_index);
            }

    }
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.numberOfTapsRequired == 2) {
        if(self.zoomScale == 1){
            
      
            float newScale = [self zoomScale] * 2;
            CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:self]];
            [self zoomToRect:zoomRect animated:YES];
            self.isLongPress = NO;
        } else {
            float newScale = [self zoomScale] / 2;
            CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:self]];
            [self zoomToRect:zoomRect animated:YES];
            self.isLongPress = YES;
        }
    }
}

- (void)handleTwoFingerTap:(UITapGestureRecognizer *)gestureRecongnizer{
    float newScale = [self zoomScale]/2;
    
    if([self zoomScale] == 1)
    {
        self.isLongPress = YES;
    }
    else
    {
        self.isLongPress = NO;
    }
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecongnizer locationInView:self]];
    [self zoomToRect:zoomRect animated:YES];
    
    
}


- (void)handleLongPressTap:(UILongPressGestureRecognizer *)gestureRecongnizer
{
    //保存图片 长按
    static CGPoint movePoint ;
    static CGPoint startPoint;
    static CGFloat offsetY = 0.0 ;

    //if(self.isLongPress == NO)
     //   return;
        
    
     UIImageView *imgV = (UIImageView *)gestureRecongnizer.view;
    
       if (gestureRecongnizer.state == UIGestureRecognizerStateBegan)
       {
           
            self.longPressblock(imgV,UIGestureRecognizerStateChanged,NO);
           
           startPoint = [gestureRecongnizer locationInView:self];
           
           if(imgV.image == nil)
               return;
           
           [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
               
               //写入图片到相册
               [PHAssetChangeRequest creationRequestForAssetFromImage:imgV.image];
               
           } completionHandler:^(BOOL success, NSError * _Nullable error) {
               NSLog(@"success = %d, error = %@", success, error);
           }];
       }
    

    //长按 拖动手势
    if(gestureRecongnizer.state == UIGestureRecognizerStateChanged)
    {
        //判断 是否是上下移动
        //获取手势的 位置
        //self.longPressblock(imgV,UIGestureRecognizerStateChanged,NO);
        
        movePoint = [gestureRecongnizer locationInView:self];

        //获取移动位置
        offsetY = (startPoint.y - movePoint.y)/3;
        
        
        if(offsetY >= 0)
        {
            CGFloat  alp  = (1 -  offsetY/HDImgVMoveDistance*0.3);
            self.backgroundColor = RGB(0 ,0, 0, alp);
        }
        else
        {
            CGFloat  alp  = (1 +  offsetY/HDImgVMoveDistance*0.3);
             self.backgroundColor = RGB(0, 0, 0, alp);
        }

        //改变视图的位置
        imgV.frame = CGRectMake(_recordOrgFrame.origin.x, _recordOrgFrame.origin.y - offsetY, _recordOrgFrame.size.width, _recordOrgFrame.size.height);
    
    }
    
    if(gestureRecongnizer.state == UIGestureRecognizerStateEnded)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            if(fabs(offsetY) >= HDImgVMoveDistance*0.5 )
            {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.longPressblock(imgV,UIGestureRecognizerStateEnded,YES);
                });
            }
            else
            {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.longPressblock(imgV,UIGestureRecognizerStateEnded,NO);
                    imgV.frame = _recordOrgFrame;
                    self.backgroundColor = RGB(0, 0, 0, 1);
                });
            }
        });
    }

}

//- (void)saveImageToPhotos:(UIImage*)savedImage {
//    UIImageWriteToSavedPhotosAlbum(savedImage,
//                                   self,
//                                   @selector(image:didFinishSavingWithError:contextInfo:),
//                                   NULL);
//}
//
//- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
//  contextInfo:(void *)contextInfo {
//
//    NSLog(@"--->保存图片成功");
//}


- (CGRect)zoomRectForScale:(CGFloat)scale withCenter:(CGPoint)center{
    CGRect zoomRect;
    zoomRect.size.height = [self frame].size.height / scale;
    zoomRect.size.width = [self frame].size.width / scale;
    zoomRect.origin.x = center.x - zoomRect.size.width / 2;
    zoomRect.origin.y = center.y - zoomRect.size.height / 2;
    return zoomRect;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    [scrollView setZoomScale:scale + 0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    self.imageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY);
}

#pragma mark - lazy

- (UIImageView *)imageView
{
    if(_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
        _imageView.userInteractionEnabled = YES;
    }
    return  _imageView;
}


- (void)setAlpha:(CGFloat)alpha
{
    _alpha = alpha;
    if(_alpha >= 1 || _alpha <= 0) return;
    //self.backgroundColor = RGB(0, 0, 0, _alpha);  //HDViewImgVBackGround(_alpha);
}


@end
