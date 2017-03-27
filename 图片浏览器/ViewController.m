//
//  ViewController.m
//  图片浏览器
//
//  Created by kun on 17/3/24.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "ViewController.h"
#import "PKPhotoBrowser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //
    NSArray *thumbA = @[@"http://ww2.sinaimg.cn/thumbnail/006gWxKPgw1f2jeloxwhnj30fu0g0ta5.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/006gWxKPgw1f2jelpn9bdj30b40gkgmh.jpg",
                        @"http://ww1.sinaimg.cn/thumbnail/006gWxKPgw1f2jelriw1bj30fz0g175g.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/006gWxKPgw1f2jelt1kh5j30b10gmt9o.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/006gWxKPgw1f2jeluxjcrj30fw0fz0tx.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/006gWxKPgw1f2jelzxngwj30b20godgn.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/006gWxKPgw1f2jelwmsoej30fx0fywfq.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/006gWxKPgw1f2jem32ccrj30xm0sdwjt.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/006gWxKPgw1f2jelyhutwj30fz0fxwfr.jpg",];
    
  
    [self.view addSubview:
     [[PKPhotoBrowser alloc]initBrowserWithThumbImgsUrl:thumbA HDImgsUrl:@[@"http://ww2.sinaimg.cn/bmiddle/006gWxKPgw1f2jeloxwhnj30fu0g0ta5.jpg",
                                                                           @"http://ww3.sinaimg.cn/bmiddle/006gWxKPgw1f2jelpn9bdj30b40gkgmh.jpg",
                                                                           @"http://ww1.sinaimg.cn/bmiddle/006gWxKPgw1f2jelriw1bj30fz0g175g.jpg",
                                                                           @"http://ww3.sinaimg.cn/bmiddle/006gWxKPgw1f2jelt1kh5j30b10gmt9o.jpg",
                                                                           @"http://ww4.sinaimg.cn/bmiddle/006gWxKPgw1f2jeluxjcrj30fw0fz0tx.jpg",
                                                                           @"http://ww3.sinaimg.cn/bmiddle/006gWxKPgw1f2jelzxngwj30b20godgn.jpg",
                                                                           @"http://ww2.sinaimg.cn/bmiddle/006gWxKPgw1f2jelwmsoej30fx0fywfq.jpg",
                                                                           @"http://ww4.sinaimg.cn/bmiddle/006gWxKPgw1f2jem32ccrj30xm0sdwjt.jpg",
                                                                           @"http://ww4.sinaimg.cn/bmiddle/006gWxKPgw1f2jelyhutwj30fz0fxwfr.jpg",] count:3 frame:CGRectMake(30, 30, 300, 300)]];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
