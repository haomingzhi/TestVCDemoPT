//
//  JYTitleView.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYTitleView : UIView
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)NSString *title;
+(JYTitleView *)newTitleView:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
