//
//  UITableView+JYTool.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (JYTool)
-(UIView *)noDataShow:(NSArray*)arr vHeight:(CGFloat)h;
-(UIView *)noDataShow:(NSArray*)arr;
-(UIView *)noDataShow:(NSArray*)arr view:(UIView *)v;

@end

NS_ASSUME_NONNULL_END
