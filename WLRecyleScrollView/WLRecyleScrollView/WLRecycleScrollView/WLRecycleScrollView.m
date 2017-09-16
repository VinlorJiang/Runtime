//
//  WLRecycleScrollView.m
//  WLRecyleScrollView
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WLRecycleScrollView.h"
#import "WLCollectionViewCell.h"

static NSString *kCollectionCellID = @"kCollectionCellID";

@interface WLRecycleScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic) UICollectionView *collectionView;


@end

@implementation WLRecycleScrollView

- (instancetype)initWithFrame:(CGRect)frame imageStringArray:(NSArray *)imageStringArray {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        self.imageStringArray = [NSArray array];
        self.imageStringArray = imageStringArray;
       
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
     [self createSubViews];
}
- (void)createSubViews {
    
    // layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height-64);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    self.collectionView = collectionView;
    [collectionView registerClass:[WLCollectionViewCell class] forCellWithReuseIdentifier:kCollectionCellID];
    [self addSubview:collectionView];
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageStringArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellID forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.imageStringArray[indexPath.row]];
//    NSLog(@"%@",cell.imageView);
//    cell.backgroundColor = indexPath.row % 2 ? [UIColor redColor] : [UIColor yellowColor];
    return cell;
    
}
#pragma mark - UICollectionViewDelegate
@end
