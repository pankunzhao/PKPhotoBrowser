//
//  UIView+PKAdd.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PKAdd)


- (UIViewController *)pk_superViewController;


#pragma mark - 获取控件的坐标长宽高
#pragma mark

@property (nonatomic, assign) CGSize  pk_size;
@property (nonatomic, assign) CGFloat pk_width;
@property (nonatomic, assign) CGFloat pk_height;
@property (nonatomic, assign) CGFloat pk_x;
@property (nonatomic, assign) CGFloat pk_y;
@property (nonatomic, assign) CGFloat pk_centerX;
@property (nonatomic, assign) CGFloat pk_centerY;

@property (nonatomic, assign) CGFloat pk_right;
@property (nonatomic, assign) CGFloat pk_bottom;


@end
