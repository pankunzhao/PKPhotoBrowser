//
//  PKPhotoBrowserConfig.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#ifndef PKPhotoBrowserConfig_h
#define PKPhotoBrowserConfig_h


#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#endif

#ifndef SCREEN_BOUNDS
#define SCREEN_BOUNDS  [UIScreen mainScreen].bounds
#endif

#ifndef RGB
#define RGB(A,B,C,D) [UIColor colorWithRed:A/255.0f green:B/255.0f blue:C/255.0f alpha:D]
#endif

#define kImageBrowserWidth (SCREEN_WIDTH + 10.0f)


#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))


#define HDViewImgVBackGround(a) RGBAColor(1,1,1,a)


/** 缩略图比例系数*/
#define  thumbImgV_W 375
#define  thumbImg_W 117
#define  thumbImginterval    6
#define  CoefficientThumbImgV(WIDTH)   WIDTH/thumbImgV_W


#define PageControlY    567
#define HDImgVMoveDistance  100






#endif /* PKPhotoBrowserConfig_h */
