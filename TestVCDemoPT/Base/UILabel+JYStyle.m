//
//  UILabel+JYStyle.m
//  TestVCDemoPT
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "UILabel+JYStyle.h"
#import "UIView+JYLayerEdit.h"
@implementation UILabel (JYStyle)
+(UILabel *)newLabel
{
    UILabel *lb = [UILabel new];
    lb.width = 100;
    lb.height = 20;
    lb.font = [UIFont systemFontOfSize:14];
    lb.textColor = [UIColor blackColor];
    lb.text = @"label";
    return lb;
}

+(UILabel *)newMarkStyleLabel:(NSString *)text
{
    UILabel *lb = [UILabel newLabel];
    lb.width = 63.5;
    lb.height = 22;
    lb.text = text;
    lb.font = [UIFont systemFontOfSize:11];
    lb.textColor = UIColorFromRGB(0x333333);
    [lb allCornerButOne:CornerTypeD withRadius:6];
    lb.backgroundColor = UIColorFromRGB(0xFED935);
    lb.textAlignment = NSTextAlignmentCenter;
    return lb;
}

+(UILabel *)newInfoMarkStyleLabel:(NSString *)text
{
    UILabel *lb = [UILabel newLabel];
    lb.width = 180;
    lb.height = 22;
    lb.text = text;
    [lb sizeToFit];
    lb.width = lb.width + 18;
    lb.font = [UIFont systemFontOfSize:11];
    lb.textColor = UIColorFromRGB(0x999999);
    [lb allCorners:11];
    [lb borderWidth:0.5];
    [lb borderColor:UIColorFromRGB(0xEFEFEF )];
    lb.textAlignment = NSTextAlignmentCenter;
    return lb;
}

+(UILabel *)newTeacherInfoLabel:(NSString *)text
{
     UILabel *lb = [UILabel newLabel];
    lb.width = UIScreenWidth - 37 - 100;
    lb.height = 16.5;
    lb.font = [UIFont systemFontOfSize:12];
    lb.textColor = UIColorFromRGB(0x999999);
    lb.text = text;
    return lb;
}


+(UILabel *)newTeacherGoodAtLabel:(NSString *)text
{
    UILabel *lb = [UILabel newLabel];
    lb.width = UIScreenWidth - 37 - 100;
    lb.height = 16.5;
    lb.font = [UIFont systemFontOfSize:12];
    lb.textColor = UIColorFromRGB(0x525252);
    lb.text = text;
    return lb;
}

+(UILabel *)newTeacherZxLabel:(NSString *)text
{
    UILabel *lb = [UILabel newLabel];
    lb.width = UIScreenWidth - 37 - 100;
    lb.height = 16.5;
    lb.font = [UIFont systemFontOfSize:12];
    lb.textColor = UIColorFromRGB(0x525252);
    lb.text = text;
    return lb;
}


@end
