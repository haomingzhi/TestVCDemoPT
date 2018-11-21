//
//  JYOrderTabBar.h
//  DDZX_js
//
//  Created by apple on 2018/11/20.
//  Copyright © 2018 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYOrderTabBar : UIView
//@property(nonatomic,assign)UIEdgeInsets layoutTabA;
//@property(nonatomic,assign)UIEdgeInsets layoutTabB;
//@property(nonatomic,assign)UIEdgeInsets layoutTabC;
@property(nonatomic,strong)UIColor *checkLineColor;
@property(nonatomic,assign)CGFloat checkLineTop;
@property(nonatomic,strong) UIFont *aFont;
@property(nonatomic,strong) UIFont *bFont;
@property(nonatomic,strong) UIFont *cFont;
@property(nonatomic,assign)NSInteger checkIndex;
@property(nonatomic,strong) void (^callBack)(NSDictionary *dic);
@property(nonatomic,strong) NSArray *titles;
@end

NS_ASSUME_NONNULL_END
