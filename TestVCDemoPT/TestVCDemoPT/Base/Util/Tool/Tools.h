//
//  Tools.h
//  JYZX
//
//  Created by yc on 2017/4/20.
//  Copyright © 2017年 Outsourcing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
+(UIImage*)createImageWithColor:(UIColor*)color;
+(NSMutableAttributedString *)backAttributeStr:(NSString *)str;
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString andHour:(BOOL)flag;
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString andHour:(BOOL)flag noYear:(BOOL)noYear;
@end
