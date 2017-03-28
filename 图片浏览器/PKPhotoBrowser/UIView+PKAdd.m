//
//  UIView+PKAdd.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "UIView+PKAdd.h"

@implementation UIView (PKAdd)

- (UIViewController *)pk_superViewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


#pragma mark - 获取控件的坐标长宽高
#pragma mark

- (CGSize)pk_size
{
    return self.frame.size;
}

- (void)setpk_size:(CGSize)pk_size
{
    CGRect frame = self.frame;
    frame.size = pk_size;
    self.frame = frame;
}

- (CGFloat)pk_width
{
    return self.frame.size.width;
}

- (CGFloat)pk_height
{
    return self.frame.size.height;
}

- (void)setpk_width:(CGFloat)pk_width
{
    CGRect frame = self.frame;
    frame.size.width = pk_width;
    self.frame = frame;
}

- (void)setpk_height:(CGFloat)pk_height
{
    CGRect frame = self.frame;
    frame.size.height = pk_height;
    self.frame = frame;
}

- (CGFloat)pk_x
{
    return self.frame.origin.x;
}

- (void)setpk_x:(CGFloat)pk_x
{
    CGRect frame = self.frame;
    frame.origin.x = pk_x;
    self.frame = frame;
}

- (CGFloat)pk_y
{
    return self.frame.origin.y;
}

- (void)setpk_y:(CGFloat)pk_y
{
    CGRect frame = self.frame;
    frame.origin.y = pk_y;
    self.frame = frame;
}

- (CGFloat)pk_centerX
{
    return self.center.x;
}

- (void)setpk_centerX:(CGFloat)pk_centerX
{
    CGPoint center = self.center;
    center.x = pk_centerX;
    self.center = center;
}

- (CGFloat)pk_centerY
{
    return self.center.y;
}

- (void)setpk_centerY:(CGFloat)pk_centerY
{
    CGPoint center = self.center;
    center.y = pk_centerY;
    self.center = center;
}

- (CGFloat)pk_right
{
    //    return self.pk_x + self.pk_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)pk_bottom
{
    //    return self.pk_y + self.pk_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setpk_right:(CGFloat)pk_right
{
    self.pk_x = pk_right - self.pk_width;
}

- (void)setpk_bottom:(CGFloat)pk_bottom
{
    self.pk_y = pk_bottom - self.pk_height;
}



@end
