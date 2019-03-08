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
+(UILabel *)newHLineLb
{
    UILabel *lb = [UILabel new];
    lb.width = UIScreenWidth;
    lb.height = LineWidth;
  
    lb.backgroundColor = UIColorFromRGB(0xe8e8e8);
    
    return lb;
}

+(UILabel *)newVLineLb
{
    UILabel *lb = [UILabel new];
    lb.width = LineWidth;
    lb.height = 20;
    
    lb.backgroundColor = UIColorFromRGB(0xe8e8e8);
    
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
    [lb infoMarkStyle:text];
    return lb;
}

-(void)infoMarkStyle:(NSString *)text
{
    self.width = 180;
    self.height = 22;
    self.text = text;
    [self sizeToFit];
    self.width = self.width + 12;
    self.height = 22;
    self.font = [UIFont systemFontOfSize:11];
    self.textColor = UIColorFromRGB(0x999999);
    [self allCorners:11];
    [self borderWidth:1];
    [self borderColor:UIColorFromRGB(0xEFEFEF )];
    self.textAlignment = NSTextAlignmentCenter;
}

//-(void)setText:(NSString *)text
//{
//    [super sette];
//}

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

+(UILabel *)newLabel:(UIColor *)textColor
{
    return [self newLabel:textColor withFont:[UIFont systemFontOfSize:14]];
}
+(UILabel *)newLabel:(UIColor *)textColor withFont:(UIFont *)font
{
    return [self newLabel:textColor withFont:font withHeight:MAXFLOAT];
}

+(UILabel *)newLabel:(UIColor *)textColor withFont:(UIFont *)font withHeight:(CGFloat)h
{
    return [self newLabel:textColor withFont:font withHeight:h withWidth:UIScreenWidth - 35];
}

+(UILabel *)newLabel:(UIColor *)textColor withFont:(UIFont *)font withHeight:(CGFloat)h withWidth:(CGFloat)w
{
    UILabel *lb = [UILabel newLabel];
    lb.width = w;
    lb.height = h;
    lb.font = font;
    lb.textColor = textColor;
    lb.numberOfLines = 0;
    [lb sizeToFit];
    return lb;
}

+(UILabel*)newNavTitleLb:(NSString *)title
{
    UILabel *lb = [UILabel newLabel];
    lb.width = UIScreenWidth - 110;
    lb.height = 30;
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont boldSystemFontOfSize:18];
    lb.textColor = UIColorFromRGB(0x333333);
    lb.text = title;
    return lb;
}

+(UILabel *)newTitleLb:(NSString *)title
{
    UILabel *lb = [UILabel newLabel];
    lb.width = UIScreenWidth - 35;
    lb.height = 30;
    lb.textAlignment = NSTextAlignmentLeft;
    lb.font = [UIFont boldSystemFontOfSize:17];
    lb.textColor = UIColorFromRGB(0x333333);
    lb.text = title;
    return lb;
}

-(void)setRichText:(NSString *)str  withColor:(UIColor*)color  withFont:(UIFont *)font
{
    [self setRichText:str withContent:self.text withColor:color withFont:font];
}

-(void)setRichText:(NSString *)str withContent:(NSString *)content withColor:(UIColor*)color
{
    [self setRichText:str withContent:content withColor:color withFont:self.font];
}
-(void)setRichText:(NSString *)str withContent:(NSString *)content withColor:(UIColor*)color withFont:(UIFont *)font
{
    NSString *kw = str;
    NSString *st = content;
    NSRange kwr = [st rangeOfString:kw];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:st];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:self.textColor
                    range:NSMakeRange(0, st.length)];
    [attrStr addAttribute:NSFontAttributeName
                    value:self.font
                    range:NSMakeRange(0, st.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:color
                    range:kwr];
    [attrStr addAttribute:NSFontAttributeName
                    value:font
                    range:kwr];
    self.attributedText = attrStr;
}

-(void)resetSize
{
    self.width = UIScreenWidth - 35;
    self.height = MAXFLOAT;
    [self sizeToFit];
}
@end
