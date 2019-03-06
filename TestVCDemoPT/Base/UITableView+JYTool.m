//
//  UITableView+JYTool.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "UITableView+JYTool.h"
#import "DDExNoDataView.h"
@implementation UITableView (JYTool)
-(UIView *)noDataShow:(NSArray*)arr view:(UIView *)v
{
    UIView *nv;
    if (arr.count == 0) {
        self.tableFooterView = v;
        nv = v;
    }
    else
    {
        self.tableFooterView = [UIView new];
        nv = v;
    }
      return nv;
}

-(UIView *)noDataShow:(NSArray*)arr
{
//    DDExNoDataView *nv = [[DDExNoDataView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, )];
//    nv.tip = @"暂无数据";
   return  [self noDataShow:arr vHeight:UIScreenHeight - 55];
    
}

-(UIView *)noDataShow:(NSArray*)arr vHeight:(CGFloat)h
{
    DDExNoDataView *nv = [[DDExNoDataView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, h)];
    nv.tip = @"暂无数据";
    nv.imgV.height = 0;
    
     nv.imgV.top = h/2.0 - nv.stateLb.height/2.0 - 20;
     return  [self noDataShow:arr view:nv];
  
}
@end
