//
//  PKImageBrowserFlowLayout.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKImageBrowserFlowLayout.h"
#import "PKPhotoBrowserConfig.h"

@implementation PKImageBrowserFlowLayout

-(id)init {
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(kImageBrowserWidth, SCREEN_HEIGHT);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0.0f;
        self.sectionInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    }
    return self;
}
//
//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//
//    return velocity;
//}
@end
