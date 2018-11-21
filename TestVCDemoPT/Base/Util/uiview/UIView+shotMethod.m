//
//  UIView+shotMethod.m
//  校园在线
//
//  Created by 游 on 2018/4/10.
//  Copyright © 2018年 游. All rights reserved.
//

#import "UIView+shotMethod.h"

@implementation UIView (shotMethod)
- (CGFloat)YTleft {
    return self.frame.origin.x;
}

- (void)setYTleft:(CGFloat)YTLeft {
    CGRect frame = self.frame;
    frame.origin.x = YTLeft;
    self.frame = frame;
}

- (CGFloat)YTtop {
    return self.frame.origin.y;
}
- (void)setYTtop:(CGFloat)YTTop {
    CGRect frame = self.frame;
    frame.origin.y = YTTop;
    self.frame = frame;
}

- (CGFloat)YTright {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)YTbottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)YTwidth {
    return self.frame.size.width;
}

- (void)setYTwidth:(CGFloat)YTwidth {
    CGRect frame = self.frame;
    frame.size.width = YTwidth;
    self.frame = frame;
}

- (CGFloat)YTheight {
    return self.frame.size.height;
}
- (void)setYTheight:(CGFloat)YTheight
{
        CGRect frame = self.frame;
        frame.size.height = YTheight;
        self.frame = frame;
}
//- (void)setYTHeight:(CGFloat)YTheight {
//    CGRect frame = self.frame;
//    frame.size.height = YTheight;
//    self.frame = frame;
//}
@end
