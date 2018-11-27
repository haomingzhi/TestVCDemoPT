//
//  ArticalScroller.m
//  LMSY
//
//  Created by 侯 on 2018/11/7.
//  Copyright © 2018 DaDaoZhiXing. All rights reserved.
//

#import "ArticalScroller.h"

@interface ArticalScroller ()<UIGestureRecognizerDelegate>

@end

@implementation ArticalScroller

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
