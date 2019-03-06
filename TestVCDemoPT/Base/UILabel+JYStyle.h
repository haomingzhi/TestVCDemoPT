//
//  UILabel+JYStyle.h
//  TestVCDemoPT
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JYStyle)

+(UILabel *)newLabel;

+(UILabel *)newMarkStyleLabel:(NSString *)text;

+(UILabel *)newInfoMarkStyleLabel:(NSString *)text;

+(UILabel *)newTeacherInfoLabel:(NSString *)text;

+(UILabel *)newTeacherGoodAtLabel:(NSString *)text;

+(UILabel *)newTeacherZxLabel:(NSString *)text;

+(UILabel *)newLabel:(UIColor *)textColor withFont:(UIFont *)font withHeight:(CGFloat)h withWidth:(CGFloat)w;

+(UILabel *)newLabel:(UIColor *)textColor withFont:(UIFont *)font withHeight:(CGFloat)h;

+(UILabel *)newLabel:(UIColor *)textColor withFont:(UIFont *)font;

+(UILabel *)newLabel:(UIColor *)textColor;

+(UILabel*)newNavTitleLb:(NSString *)title;

+(UILabel *)newTitleLb:(NSString *)title;

+(UILabel *)newHLineLb;

+(UILabel *)newVLineLb;
-(void)resetSize;
-(void)setRichText:(NSString *)str withContent:(NSString *)content withColor:(UIColor*)color withFont:(UIFont *)font;
-(void)setRichText:(NSString *)str withContent:(NSString *)content withColor:(UIColor*)color;
-(void)setRichText:(NSString *)str  withColor:(UIColor*)color  withFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
