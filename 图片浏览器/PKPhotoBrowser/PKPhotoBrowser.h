//
//  PKPhotoBrowser.h
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKPhotoBrowser : UIView


/**
 *  初始化缩略图展示
 *
 *  @param thumbImgsUrl <#thumbImgsUrl description#>
 *  @param HDImgsUrl    <#HDImgsUrl description#>
 *  @param count        <#count description#>
 *  @param frame        <#frame description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initBrowserWithThumbImgsUrl:(NSArray  *)thumbImgsUrl HDImgsUrl:(NSArray *) HDImgsUrl count:(NSInteger )count frame:(CGRect) frame;




//提供一个借口返回视图所在位置




@end
