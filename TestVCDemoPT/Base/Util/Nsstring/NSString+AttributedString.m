//
//  NSString+AttributedString.m
//  SKClub
//
//  Created by 游👂 on 16/11/7.
//  Copyright © 2016年 tyrion. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f,NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
                          };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.height;
}
-(CGFloat)getSpaceLabelWidtrwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withHeight:(CGFloat)height {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f,NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
                          };
    CGSize size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT,height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.width;
}
@end
