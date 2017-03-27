//
//  PKThumbnailView.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void (^clickThumbImgVBlock)(UIImageView *thumbImg , NSInteger index);

@interface PKThumbnailView : UIView


@property (nonatomic, copy,readonly)NSMutableArray *subImgVsPoint;
@property (nonatomic, copy,readonly)NSMutableArray *subImgs;



- (instancetype ) initWithThumbImgsUrl:(NSArray *)thumbImgsUrl count:(NSInteger) count clickAfterBlock:(clickThumbImgVBlock)block;

@end
