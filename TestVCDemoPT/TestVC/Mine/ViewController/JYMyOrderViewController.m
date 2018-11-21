//
    //  MyOrderViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYMyOrderViewController.h"
#import "JYMyOrderViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"

#import "JYOrderTabBar.h"
#import "JYOrderNumTableViewCell.h"
#import "JYOrderInfoTableViewCell.h"
#import "JYOrderStateTableViewCell.h"

@interface JYMyOrderViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYMyOrderViewModel *viewModel;
@property(nonatomic,strong)JYOrderTabBar *tabBar;
@end

@implementation JYMyOrderViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的订单";
    [self.view addSubview:self.tabBar];
    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.tableView];

}

-(JYOrderTabBar *)tabBar
{
    if (!_tabBar) {
        _tabBar = [JYOrderTabBar new];
        _tabBar.width = UIScreenWidth;
        _tabBar.height = 36;
        _tabBar.top = NavHeight;
        _tabBar.titles = @[@"全部订单",@"待付款",@"交易成功",@"交易失败"];
        [_tabBar setCallBack:^(NSDictionary * _Nonnull dic) {
            
        }];
    }
    return _tabBar;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 125;
    if(indexPath.row == 0)
    {
        return 30;
    }
    else  if(indexPath.row == 1)
    {
        return 96;
    }
    else
    {
        return 45;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    v.backgroundColor = UIColorFromRGB(0xF9F9F9);
    return v;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 10;
//}
//
//-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *v = [UIView new];
//    v.backgroundColor = UIColorFromRGB(0xF9F9F9);
//    return v;
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//     __weak typeof(self) weak_self = self;
//    UITableViewCell *cell;
//     cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderTableViewCell"];
//    if(!cell)
//    {
//    [tableView registerClass:[JYOrderTableViewCell class] forCellReuseIdentifier:@"JYOrderTableViewCell"];
//    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
//    cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderTableViewCell"];
//    }
//    NSDictionary *dic = @{@"img":@"",@"title":@"2018年福建省中小学骨干班主任省级培训",@"orderNum":@"订单号：20181010239",@"time":@" 10-12 10:10",@"price":@"¥2999",@"tip":@"支付剩余时间：29:59",@"state":@1,@"stateTag":@"已支付"};
//        [(JYOrderTableViewCell*)cell refresh:dic];
//
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
    if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderNumTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYOrderNumTableViewCell class] forCellReuseIdentifier:@"JYOrderNumTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderNumTableViewCell"];
        }
        NSDictionary *dic = @{@"orderNum":@"2018-10-16 订单号：1008787372",@"tip":@""};
            [(JYOrderNumTableViewCell*)cell refresh:dic];
        
    }
    else  if (indexPath.row == 1)
    {
       
          if(!cell)
          {
              [tableView registerClass:[JYOrderInfoTableViewCell class] forCellReuseIdentifier:@"JYOrderInfoTableViewCell"];
              //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
              cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderInfoTableViewCell"];
          }
        NSDictionary *dic = @{@"title":@"啊是的范德萨发斯蒂芬",@"name":@"阿斯蒂芬",@"price":@"￥231",@"img":@"默认头像"};
              [(JYOrderInfoTableViewCell*)cell refresh:dic];
        
        
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderStateTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYOrderStateTableViewCell class] forCellReuseIdentifier:@"JYOrderStateTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYOrderStateTableViewCell"];
        }
        NSDictionary *dic = @{@"stateTag":@"待付款",@"aTitle":@"取消订单",@"bTitle":@"立即支付"};
            [(JYOrderStateTableViewCell*)cell refresh:dic];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UITableView *)tableView
{
    if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight + 36, self.view.width, self.view.height - NavHeight - 36) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CGFloat contentInsetTop = 0.f;
    _tableView.contentInset = UIEdgeInsetsMake(contentInsetTop, 0, 0, 0);
    _tableView.backgroundColor  = [UIColor clearColor];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    }
    return _tableView;
}

@end
