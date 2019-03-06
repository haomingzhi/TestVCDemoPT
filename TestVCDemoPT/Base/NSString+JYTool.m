//
//  NSString+JYTool.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "NSString+JYTool.h"

@implementation NSString (JYTool)
-(CGSize)getSize:(UIFont *)font
{
    return [self getSize:font size:CGSizeMake(UIScreenWidth, 20)];
}

-(CGSize)getSize:(UIFont *)font size:(CGSize )s
{
    NSString *cc = self;
    
    NSMutableDictionary *tattrDict = [NSMutableDictionary dictionary];
    tattrDict[NSFontAttributeName] = font;//[UIFont systemFontOfSize:11];
    CGSize ccsz = [cc boundingRectWithSize:s options:NSStringDrawingUsesLineFragmentOrigin attributes:tattrDict context:nil].size;
    return ccsz;
}
@end
