//
//  UITextView+placeHolder.h
//  校园在线
//
//  Created by 游 on 2018/1/4.
//  Copyright © 2018年 游. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (placeHolder)
@property (nonatomic,copy)NSString *placeHolderStr;
@property (nonatomic,assign) NSInteger font;
@property (nonatomic,strong) UIColor *color;
@end
