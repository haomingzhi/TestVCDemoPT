//
//  UITextView+JYStyle.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "UITextView+JYStyle.h"

@implementation UITextView (JYStyle)

+(UITextView*)newTextViewForAttStyle
{
   return [UITextView newTextViewForAttStyle:nil];
}

+(UITextView *)newTextViewForAttStyle:(nullable UIViewController *)vc
{
    UITextView *tv = [UITextView new];
    tv.width = UIScreenWidth - Padding * 2;
    tv.height = UIScreenWidth;
    tv.left = Padding;
    tv.backgroundColor = [UIColor lightGrayColor];
    [tv configAttStyle:vc];
    return tv;
}

-(void)configAttStyle
{
    [self configAttStyle:nil];
}

-(void)configAttStyle:(nullable UIViewController *) vc
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"这是一段可点击的文字，点击百度去浏览网页吧,当然你也可以点击自定义来执行用户事件！"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"https://www.baidu.com"
                             range:[[attributedString string] rangeOfString:@"百度"]];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"CustomTapEvents://"
                             range:[[attributedString string] rangeOfString:@"自定义"]];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:20]
                             range:NSMakeRange(0, attributedString.length)];
    self.attributedText = attributedString;
    self.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
                                         NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                         NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    self.delegate = (id)vc;
//    self.editable = NO;
    self.scrollEnabled = NO;
}

-(void)configLinkAtt:(NSMutableAttributedString *)att
{
 
    [att addAttribute:NSLinkAttributeName
                             value:@"xxx://"
                             range:NSMakeRange(0, att.length)];
    
}
@end
