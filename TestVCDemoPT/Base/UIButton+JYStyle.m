//
//  UIButton+JYStyle.m
//  QQBtn
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 WJY. All rights reserved.
//

#import "UIButton+JYStyle.h"
#import "UIView+JYLayerEdit.h"
@implementation UIButton (JYStyle)
+(UIButton *)newBtn
{
    UIButton *btn = [UIButton new];
    btn.bounds = CGRectMake(0, 0, 60, 30);
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"button" forState:UIControlStateNormal];
    return btn;
}

+(UIButton *)findTeacherBtn
{
    return [UIButton newStyleBtn:@"找老师咨询"];
}

+(UIButton *)newStyleBtn:(NSString *)text
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 240;
    btn.height = 45;
    [btn allCorners:22];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromRGB(0x525252) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn gradientColor:UIColorFromRGB(0xFFEF73) toColor:UIColorFromRGB(0xFDDA3F)];
    return btn;
}


@end
