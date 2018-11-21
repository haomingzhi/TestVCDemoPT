//
//  NSTimer+block.h
//  校园在线
//
//  Created by 游 on 2018/5/25.
//  Copyright © 2018年 游. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (block)
+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *timer))block;
@end
