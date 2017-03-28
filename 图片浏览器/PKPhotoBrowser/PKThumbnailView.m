
//
//  PKThumbnailView.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "PKThumbnailView.h"
#import "PKPhotoBrowserConfig.h"
#import "UIImageView+WebCache.h"
#import "NSString+PKAdd.h"
#import "UIView+WebCache.h"

@interface PKThumbnailView ()

@property (nonatomic, copy) NSArray *thumbImgsUrl;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSMutableArray<UIImageView *> *recordThumbImgVs;
@property (nonatomic, copy) clickThumbImgVBlock callBackBlock;

@property (nonatomic, copy,readwrite)NSMutableArray *subImgVsPoint;
@property (nonatomic, copy,readwrite)NSMutableArray *subImgs;

@end



@implementation PKThumbnailView


#pragma mark - lift
- (instancetype ) initWithThumbImgsUrl:(NSArray *)thumbImgsUrl count:(NSInteger) count clickAfterBlock:(clickThumbImgVBlock)block
{
    
    if(self = [super init])
    {
        self.thumbImgsUrl = thumbImgsUrl;
        self.count = count;
        self.callBackBlock = block;
        self.userInteractionEnabled = YES;
        
        //设置UI
        [self setupUI];
        
    }
    
    return self;
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    
    //计算Frame
    CGSize superSize = newSuperview.frame.size;
    
    self.frame = newSuperview.bounds;
    
    //如果 只有一张图片跟 父视图一样
    if(self.thumbImgsUrl.count == 1)
    {
    
    }
    
    int totalloc=(int)self.count;
    CGFloat appvieww= thumbImg_W * CoefficientThumbImgV(superSize.width);
    CGFloat margin= thumbImginterval * CoefficientThumbImgV(superSize.width) ;
    
    //如果多张 那么 进行缩略图
    
    for(int i = 0 ; i < _recordThumbImgVs.count ; i ++)
    {
        int row = i/totalloc;//行号
        int loc=i%totalloc;//列号
        UIImageView *imgV = _recordThumbImgVs[i];
        
        CGFloat appviewx=margin+(margin+appvieww)*loc;
        CGFloat appviewy=margin+(margin+appvieww)*row;
    
        imgV.frame = CGRectMake(appviewx, appviewy, appvieww, appvieww);
    }

}



#pragma mark  - 返回视图的位置




#pragma  mark - private
- (void)setupUI
{
    //反向便利
    [_thumbImgsUrl enumerateObjectsUsingBlock:^(NSString*  _Nonnull urlStr, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.userInteractionEnabled = YES;
        imgV.tag = idx;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickThumbImgV:)];
        [imgV addGestureRecognizer:tap];
        
#warning  SDWebimgV 进行网络加载图片
        //imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",(int)idx + 1]];
        
        [imgV sd_setShowActivityIndicatorView:YES];
        [imgV sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
        
    
        [self addSubview:imgV];
        //添加
        [self.recordThumbImgVs addObject:imgV];
        
    }];
    
}

- (void)clickThumbImgV:(UITapGestureRecognizer *)tapG
{

    //获取缩略图的
    UIImageView *thumbImgV = (UIImageView *)tapG.view;
    NSInteger index = thumbImgV.tag;

    if(self.callBackBlock)
    {
        self.callBackBlock(thumbImgV,index);
    }
}

#pragma mark - lazy
- (NSMutableArray *)recordThumbImgVs
{
    if(_recordThumbImgVs == nil)
    {
        _recordThumbImgVs = [NSMutableArray arrayWithCapacity:self.thumbImgsUrl.count];
    }
    return _recordThumbImgVs;
}


- (NSMutableArray *)subImgVsPoint
{
    if(_subImgVsPoint == nil)
    {
    
        _subImgVsPoint = [NSMutableArray arrayWithCapacity:self.recordThumbImgVs.count];
        
        [self.recordThumbImgVs enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imgV, NSUInteger idx, BOOL * _Nonnull stop) {
            
            //便利获取 当to (nil)=  为self.view.windown
            CGPoint imgVPointInSuperView = [imgV convertPoint:imgV.center toView:nil];
            
            [_subImgVsPoint addObject: [NSString pixelVlaueToPoint:imgVPointInSuperView]];
            
        }];
    }

    return _subImgVsPoint;
}


- (NSMutableArray *)subImgs
{
   
    if(_subImgs == nil)
    {
        _subImgs = [NSMutableArray arrayWithCapacity:self.recordThumbImgVs.count];

        
        [self.recordThumbImgVs enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imgV, NSUInteger idx, BOOL * _Nonnull stop) {
            [_subImgs addObject: imgV.image];
        }];
    }

    return _subImgs;
}






@end
