//
//  customLabel.m
//  校园在线
//
//  Created by 游 on 2017/9/26.
//  Copyright © 2017年 游. All rights reserved.
//

#import "customLabel.h"

@implementation customLabel

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font aligement:(NSTextAlignment)alignment textColor:(UIColor *)color num:(NSInteger)num
{
    if (self = [super initWithFrame:frame]) {
        self.numberOfLines = num;
        self.textAlignment = alignment;
        self.textColor = color;
        self.font = font;
        self.text = title;

    }
    return self;
}




@end
