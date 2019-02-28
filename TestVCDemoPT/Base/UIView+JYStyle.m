//
//  UIView+JYStyle.m
//  TestVCDemoPT
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "UIView+JYStyle.h"
#import "UIView+JYLayerEdit.h"
@implementation UIView (JYStyle)
+(UIView *)newView
{
    UIView *v = [UIView new];
    
    return v;
}

+(UIView *)newShadowView:(UIView*)superView
{
    UIView *v = [UIView newView];
    v.width = UIScreenWidth - 37;
    v.height = 160;
    [superView addSubview:v];
    [v allCorners:4.5];
   [v shadowColor:UIColorFromRGBA(0x000000, 0.1) shadowOffset:CGSizeMake(2, 2)];
    return v;
}


@end
