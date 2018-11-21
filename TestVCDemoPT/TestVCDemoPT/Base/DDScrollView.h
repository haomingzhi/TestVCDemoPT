//
//  DDScrollView.h
//  NIM
//
//  Created by apple on 2018/7/18.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DDScrollViewDataDelegate <UITableViewDataSource>

@end

@protocol DDScrollViewDelegate<NSObject,UITableViewDelegate>
@optional
-(void)changeIndex:(NSInteger)index srollView:(UIScrollView*)sc;
@end

@interface DDScrollView : UIScrollView
@property(nonatomic,weak)id<DDScrollViewDataDelegate> DDdelegate;
@property(nonatomic,weak)id<DDScrollViewDelegate> DDscrollViewdelegate;
//@property(nonatomic,strong)viewModel //数据model
@property(nonatomic,assign)NSInteger tablesCount;
@property(nonatomic,readonly)NSArray *tables;
@property(nonatomic,assign)NSInteger checkIndex;
-(void)refreshData;//刷新页面
@end
