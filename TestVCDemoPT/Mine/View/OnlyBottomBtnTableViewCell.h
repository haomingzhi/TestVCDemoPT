//
//  OnlyBottomBtnTableViewCell.h
//  ChaoLiu
//
//  Created by air on 15/7/27.
//  Copyright (c) 2015年 ORANLLC_IOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYAbstractTableViewCell.h"
//#import "BUImageRes.h"

@interface OnlyBottomBtnTableViewCell : JYAbstractTableViewCell
@property(nonatomic,strong) void (^extrHandleAction)(id o);
@property(nonatomic,strong) void (^extrHandleAction2)(id o);
@property(nonatomic,strong) void (^extrHandleAction3)(id o);
//-(void)setCellData:(NSDictionary *)dataDic;
@property(nonatomic,strong)   UIButton *getBtn;
-(void)setPadding:(CGFloat)padding;
-(void)setHeightPadding:(CGFloat)padding;
-(void)setBtnBackgroundColor:(UIColor *)color;
-(void)setBtnTitleColor:(UIColor *)color;
-(void)btnLayer:(BOOL)J;

-(void)fitMineMode;
@end
