//
//  ViewController.m
//  YTScrollViewDemo
//
//  Created by TonyAng on 16/3/31.
//  Copyright © 2016年 TonyAng. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"

@interface ViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *ytScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"YTScrollView";
    _ytScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _ytScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 180);
    [self.view addSubview:_ytScrollView];
    
    /*
     // 情景一：采用本地图片实现
     NSArray *imageNames = @[@"1.jpg",
     @"2.jpg",
     @"3.jpg",
     @"4.jpg",
     ];
     */
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"http://img.1985t.com/uploads/attaches/2014/08/21606-xnN9uZ.jpg",
                                  @"http://c.hiphotos.baidu.com/image/pic/item/f7246b600c3387448982f948540fd9f9d72aa0bb.jpg",
                                  @"http://d.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd11c1c35727bb12c8fcc3ce2dbb.jpg",
                                  @"http://c.hiphotos.baidu.com/image/pic/item/64380cd7912397dd5393db755a82b2b7d1a287dd.jpg",
                                  @"http://e.hiphotos.baidu.com/image/pic/item/b999a9014c086e06613eab4b00087bf40ad1cb18.jpg",
                                  @"http://d.hiphotos.baidu.com/image/pic/item/9e3df8dcd100baa1fee8fdbf4510b912c9fc2ee9.jpg",
                                  @"http://d.hiphotos.baidu.com/image/pic/item/aa64034f78f0f736ac6e8b010855b319ebc41319.jpg",
                                  @"http://f.hiphotos.baidu.com/image/pic/item/2934349b033b5bb5840f12af34d3d539b700bc82.jpg",
                                  @"http://e.hiphotos.baidu.com/image/pic/item/6a600c338744ebf8a668dc3fdbf9d72a6059a791.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"1",
                        @"2",
                        @"3",
                        @"4",
                        @"5",
                        @"6",
                        @"7",
                        @"8",
                        @"9"];
    
    CGFloat w = [[UIScreen mainScreen] bounds].size.width;
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"Loading"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [_ytScrollView addSubview:cycleScrollView2];
    
    //模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
