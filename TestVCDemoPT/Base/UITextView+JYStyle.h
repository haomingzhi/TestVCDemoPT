//
//  UITextView+JYStyle.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JYStyle)
+(UITextView*)newTextViewForAttStyle;
+(UITextView*)newTextViewForAttStyle:(nullable UIViewController *)vc;
-(void)configAttStyle:(nullable UIViewController *)vc;
-(void)configAttStyle;
-(void)configLinkAtt:(NSMutableAttributedString *)att;
@end

NS_ASSUME_NONNULL_END
