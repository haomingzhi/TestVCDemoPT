//
    //  EvaListViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYEvaListViewController.h"
#import "JYEvaListViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYEvaTableViewCell.h"
#import "JYEvaHeadView.h"
#import  "JYEvaBottomView.h"@interface JYEvaListViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYEvaListViewModel *viewModel;
@property(nonatomic,strong)JYEvaBottomView *bottomView;
@property(nonatomic,strong)JYEvaHeadView *headView;
@end
@implementation JYEvaListViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    [self.view addSubview:[UIView new]];
    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 146;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    UIView *v = [UIView new];
//    v.backgroundColor = UIColorFromRGB(0xF9F9F9);
    return self.headView;
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     cell = [tableView dequeueReusableCellWithIdentifier:@"JYEvaTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYEvaTableViewCell class] forCellReuseIdentifier:@"JYEvaTableViewCell"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYEvaTableViewCell"];
    }
    NSDictionary *dic = @{@"img":@"头像",@"name":@"ddd",@"time":@"2小时前",@"content":@"大家福利肯德基公司的开发工具；来的开发更多福利； 但是老公；受到法国进口时代；看过",@"star":@"4"};
        [(JYEvaTableViewCell*)cell refresh:dic];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UITableView *)tableView
{
    if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, self.view.width, self.view.height - NavHeight - 66) style:UITableViewStylePlain];
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

-(JYEvaHeadView*)headView
{
    if (!_headView) {
        _headView = [JYEvaHeadView new];
        [_headView refresh:@{@"star":@"4.0"}];
    }
    return _headView;
}

-(JYEvaBottomView *)bottomView
{
    if (!_bottomView) {
        
        _bottomView = [JYEvaBottomView new];
        _bottomView.top = self.view.height - 66;
    }
    return _bottomView;
}

@end
