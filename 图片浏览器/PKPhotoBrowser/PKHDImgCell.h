//
//  PKHDImgCell.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKImageItem.h"

@interface PKHDImgCell : UICollectionViewCell

//需要一个scrollView  进行操作

@property (nonatomic, strong) PKImageItem* HDImagItem;

- (void)configCellWithHDUrl:(NSString *)urlStr
                   thumbImg:(UIImage *)thumbImage
                      index:(int) index
                   tapBlock:(tapImgVBlock) block
             longPressBlock:(longPressImgVBlock) longPreBlock
;

@end
