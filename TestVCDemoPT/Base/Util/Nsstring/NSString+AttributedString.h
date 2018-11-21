//
//  NSString+AttributedString.h
//  SKClub
//
//  Created by 游👂 on 16/11/7.
//  Copyright © 2016年 tyrion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AttributedString)
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;
-(CGFloat)getSpaceLabelWidtrwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withHeight:(CGFloat)height;
@end
