//
//  PKPhotoBrowser.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKPhotoBrowser.h"
#import "PKThumbnailView.h"
#import "UIView+PKAdd.h"
#import "PKPhotoHDViewController.h"


@interface PKPhotoBrowser  ()

/**配略图 */
@property (nonatomic, copy) NSArray * thumbImgsUrl;
/**高清图 */
@property (nonatomic, copy) NSArray * HDImgsUrl;
/**每行显示个数 */
@property (nonatomic, assign) NSInteger count;
/**获取屏幕快照 */
@property (nonatomic,strong) UIImage* screenshot;

/**缩略图控件 */
@property (nonatomic, strong) PKThumbnailView *thumbnailView;


@end


@implementation PKPhotoBrowser

#pragma mark - lift
//创建
- (instancetype)initBrowserWithThumbImgsUrl:(NSArray  *)thumbImgsUrl HDImgsUrl:(NSArray *) HDImgsUrl count:(NSInteger )count frame:(CGRect) frame
{
    
    if(!thumbImgsUrl || thumbImgsUrl.count == 0 )
        return  nil;
        
    
    //创建缩略图
    if(self = [super initWithFrame:frame])
    {
        self.thumbImgsUrl = thumbImgsUrl;
        self.HDImgsUrl = HDImgsUrl;
        self.count = count;
        self.frame  = frame;
        
        self.backgroundColor = [UIColor yellowColor];
        self.userInteractionEnabled = YES;
        
        //添加缩略图展示
        [self addSubview:self.thumbnailView];
    }
    
    return self;
}


#pragma mark - publlic method










#pragma mark - private method


//对屏幕进行截屏
- (UIImage *)_screenshotFromView:(UIView *)aView {
    UIGraphicsBeginImageContextWithOptions(aView.bounds.size,NO,[UIScreen mainScreen].scale);
    [aView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshotImage;
}


#pragma mark - lazy
- (PKThumbnailView *)thumbnailView
{
    if(_thumbnailView == nil)
    {
        
        __weak typeof(self) weakSelf = self;
        _thumbnailView = [[PKThumbnailView alloc]initWithThumbImgsUrl:self.thumbImgsUrl count:_count clickAfterBlock:^(UIImageView *thumbImg, NSInteger index) {

            PKPhotoHDViewController *vC = [[PKPhotoHDViewController alloc]init];
            vC.thumbFrames = weakSelf.thumbnailView.subImgVsPoint;
            vC.HDImgsUrl = weakSelf.HDImgsUrl;
            vC.currentIndex = (int)index;
            vC.thumbImgs = weakSelf.thumbnailView.subImgs;
            vC.screenshot = [self _screenshotFromView:[UIApplication sharedApplication].keyWindow];
            
            [self.pk_superViewController presentViewController:vC animated:YES completion:^{
                NSLog(@"跳转到 新界面");
            }];
        }];
    }
    
    return _thumbnailView;
}



    

@end
