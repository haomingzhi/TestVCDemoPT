//
//  JYBigTitleView.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYMarkView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JYBigTitleView : UIView
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)JYMarkView *markV;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSArray *marks;
+(JYBigTitleView *)newTitleView:(NSString *)str;
//-(void)setTitle:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
