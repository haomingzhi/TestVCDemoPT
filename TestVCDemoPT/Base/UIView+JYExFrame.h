//
//  UIView+JYExFrame.h
//  JiXie
//
//  Created by air on 15/6/3.
//  Copyright (c) 2015年 ORANLLC_IOS1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JYExFrame)
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;
@property(nonatomic, assign)CGFloat left;
@property(nonatomic, assign)CGFloat top;
//@property(nonatomic) UIColor * borderColor;
//@property(nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
-(CGSize) middle:(CGSize ) s;
//- (UIView *)normalShadow:(UIView *)imgv;
//- (UIView *)normalShadow:(UIView *)imgv withShadowOffset:(CGSize)size;
//- (UIView *)normalShadow:(UIView *)imgv withShadowColor:(UIColor *)color;
@end
