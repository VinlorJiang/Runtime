//
//  ViewController.m
//  WLRecyleScrollView
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "WLRecycleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setCollectionView];
    
    UIImageView *ima = [[UIImageView alloc] initWithFrame:CGRectMake(200, 50, 100, 50)];
    ima.image = [UIImage imageNamed:@"h1.jpg"];
//    [self.view addSubview:ima];

    
}


- (void)setCollectionView {
    
    // data source
    NSArray *array = @[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg"];
    
    CGRect frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width * 3 / 8);
    
    WLRecycleScrollView *recycleView = [[WLRecycleScrollView alloc] initWithFrame:frame imageStringArray:array];
    
    [self.view addSubview:recycleView];
}


@end
