//
//  Tools.m
//  JYZX
//
//  Created by yc on 2017/4/20.
//  Copyright © 2017年 Outsourcing. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(NSMutableAttributedString *)backAttributeStr:(NSString *)str{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    [paragraphStyle setLineSpacing:2.0];
    //段落间距
    [paragraphStyle setParagraphSpacing:5.0];
    //第一行头缩进
//    [paragraphStyle setFirstLineHeadIndent:15.0];
    //头部缩进
//        [paragraphStyle setHeadIndent:15.0];
    //尾部缩进
    //[paragraphStyle setTailIndent:250.0];
    //最小行高
    //[paragraphStyle setMinimumLineHeight:20.0];
    //最大行高
    //[paragraphStyle setMaximumLineHeight:20.0];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    
    return attributedString;
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString andHour:(BOOL)flag
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    if (flag) {
        [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];//
    }else{
        [formatter setDateFormat:@"yyyy年MM月dd日"];// HH:mm
    }
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString andHour:(BOOL)flag noYear:(BOOL)noYear
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    if (flag) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];//
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];// HH:mm
    }
    if (noYear) {
        [formatter setDateFormat:@"MM-dd"];//
    }
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
@end


