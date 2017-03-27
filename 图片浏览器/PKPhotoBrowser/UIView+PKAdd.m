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



@end
