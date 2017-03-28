//
//  NSString+PKAdd.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "NSString+PKAdd.h"
#import "sys/utsname.h"

@implementation NSString (PKAdd)

//
//NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//
////iPhone
//if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
//if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
//if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
//if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
//if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
//if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
//if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
//if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
//if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
//if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
//if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";


+ (NSString *) pixelVlaueToPoint:(CGPoint)point
{
    
    NSInteger xs = 0;
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    CGFloat H = [UIScreen mainScreen].bounds.size.height;
    
    if(W < 414 && H < 736)
    {
        xs = H/320;
    }
    else if( W >= 414)
    {
        xs = H/320;
    }
    return NSStringFromCGPoint(CGPointMake(point.x/xs, point.y/xs));
}




@end
