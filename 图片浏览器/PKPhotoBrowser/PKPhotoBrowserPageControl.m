

//
//  PKPhotoBrowserPageControl.m
//  图片浏览器
//
//  Created by kun on 17/3/25.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKPhotoBrowserPageControl.h"
#import "PKPhotoBrowserConfig.h"

@implementation PKPhotoBrowserPageControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithPageNum:(NSInteger )pageNum currentPage:(NSInteger) currentPage
{
    if(self = [super init])
    {
        self.numberOfPages = pageNum;
        self.currentPage = currentPage;
    }
    return self;
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(newSuperview.center.x, PageControlY, 0, 0);
}





@end
