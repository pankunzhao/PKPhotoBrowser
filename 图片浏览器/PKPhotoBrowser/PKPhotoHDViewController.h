//
//  PKPhotoHDViewController.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKPhotoHDViewController : UIViewController

// HD图位置
@property (nonatomic, copy) NSArray * HDImgsUrl;

// 缩略图位置
@property (nonatomic, copy) NSArray * thumbImgs;

// 缩略图位置
@property (nonatomic, copy) NSArray* thumbFrames;

// 选中位置
@property (nonatomic, assign) int  currentIndex;

@property (nonatomic, strong) UIImage *screenshot;

//






@end
