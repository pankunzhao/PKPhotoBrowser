//
//  PKHDImgCell.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKHDImgCell.h"
#import "PKPhotoBrowserConfig.h"

@implementation PKHDImgCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //self.backgroundColor = RandColor;
        self.HDImagItem = [[PKImageItem alloc] initWithFrame:SCREEN_BOUNDS];
        [self.contentView addSubview:self.HDImagItem];
    }
    return self;
}


- (void)configCellWithHDUrl:(NSString *)urlStr
                   thumbImg:(UIImage *)thumbImage
                      index:(int) index
                   tapBlock:(tapImgVBlock) block
                  longPressBlock:(longPressImgVBlock)longPreBlock
{
    [self.HDImagItem configHDImageItem:urlStr
                            thumbImage:thumbImage
                                 index:index
                              tapBlock:block
                             longPress:longPreBlock];
}


- (void)savePhoto
{
    [self.HDImagItem savePhoto];
}



@end
