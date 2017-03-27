//
//  PKImageItem.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>



//代理 或者Block
typedef void (^tapImgVBlock)(UIImageView *imagV, int index);
typedef void (^longPressImgVBlock)(UIImageView *imagV,
                                 UIGestureRecognizerState longPressState,
                                 BOOL isExitHD);




@interface PKImageItem : UIScrollView

@property (nonatomic,strong) UIImageView* imageView;
@property (nonatomic,copy) NSString *urlStr;
@property (nonatomic,strong) UIImage *thumbImg;



- (void)configHDImageItem:(NSString *)urlStr
                thumbImage:(UIImage *)thumgImage
                    index:(int) index
                 tapBlock:(tapImgVBlock) block
                longPress:(longPressImgVBlock) longPressBlock;
@end
