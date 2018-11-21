//
//  UIView+shotMethod.h
//  校园在线
//
//  Created by 游 on 2018/4/10.
//  Copyright © 2018年 游. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (shotMethod)
@property(nonatomic) CGFloat            YTleft;
@property(nonatomic) CGFloat            YTtop;
@property(nonatomic, readonly) CGFloat  YTright;
@property(nonatomic, readonly) CGFloat  YTbottom;
@property(nonatomic) CGFloat            YTwidth;
@property(nonatomic) CGFloat            YTheight;
@end
