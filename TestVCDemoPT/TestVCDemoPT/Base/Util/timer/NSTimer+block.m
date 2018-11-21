//
//  NSTimer+block.m
//  校园在线
//
//  Created by 游 on 2018/5/25.
//  Copyright © 2018年 游. All rights reserved.
//

#import "NSTimer+block.h"

@implementation NSTimer (block)
+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *))block{
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timered:) userInfo:[block copy] repeats:repeats];
    return timer;
}

+ (void)timered:(NSTimer*)timer {
    void (^block)(NSTimer *timer)  = timer.userInfo;
    block(timer);
}

@end
