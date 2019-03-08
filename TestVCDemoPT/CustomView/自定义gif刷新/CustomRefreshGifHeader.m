//
//  CustomRefreshGifHeader.m
//  校园在线
//
//  Created by 游 on 2017/10/16.
//  Copyright © 2017年 游. All rights reserved.
//

#import "CustomRefreshGifHeader.h"


@implementation CustomRefreshGifHeader

- (void)prepare
{
    [super prepare];
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (int i = 0; i<=49; i++) {
        UIImage *image = nil;
        if (i < 10) {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"逻马生涯下拉刷新_0000%d",i]];
        }else{
            image = [UIImage imageNamed:[NSString stringWithFormat:@"逻马生涯下拉刷新_000%d",i]];
        }

        if (image) {
             [idleImages addObject:image];
        }
       
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (int i = 0; i<=49; i++) {
        UIImage *image = nil;
        if (i < 10) {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"逻马生涯下拉刷新_0000%d",i]];
        }else{
            image = [UIImage imageNamed:[NSString stringWithFormat:@"逻马生涯下拉刷新_000%d",i]];
        }
        
        if (image) {
            [refreshingImages addObject:image];
        }
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    //隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    //隐藏状态
    self.stateLabel.hidden = YES;
}

-(void)setState:(MJRefreshState)state{
    [super setState:state];
    if (state == 2) {
//        LMGloablVar.sharedGloablVar.hideSVProgress = true;
    }else{
//        LMGloablVar.sharedGloablVar.hideSVProgress = false;
    }
}

@end
