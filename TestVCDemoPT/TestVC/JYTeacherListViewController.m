//
//  JYTeacherListViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherListViewController.h"
#import "UIButton+JYStyle.h"
#import "UILabel+JYStyle.h"
#import "JYTeacherListViewModel.h"
#import "JYTeacherListTableViewCell.h"
#import "UITableView+JYTool.h"
#import "JYTeacherInfoViewController.h"
//#import "CustomRefreshGifHeader.h"
@interface JYTeacherListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYTeacherListViewModel *viewModel;

@property(nonatomic,strong)UIView *navBackgroundView;
@end

@implementation JYTeacherListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"选科、志愿、升学咨询";
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
   self.navigationItem.titleView = [UILabel newNavTitleLb:self.title];
    UIButton *backBtn = [UIButton newNavBackBtn:0];
    [backBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.navBackgroundView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.tableView];
    //    [self setTable];
    [self fetchData];
}

-(void)fetchData
{
    __weak typeof(self) weak_self = self;
    [self.viewModel fetchData:@{} Completion:^(BOOL b, NSString *msg) {
        //                    [SV_DDLoading dismiss];
        
        if(!b)
        {
            [weak_self.tableView reloadData];
            return ;
        }
        
        [weak_self.tableView reloadData];
        [weak_self.tableView noDataShow:weak_self.viewModel.dataArr];
    }];
}
//-(void)setTable
//{
//    __weak typeof(self) weak_self = self;
//    //下拉刷新
//    __weak UITableView *tableView = self.tableView;
//    tableView.mj_header = [CustomRefreshGifHeader headerWithRefreshingBlock:^{
//        //        [SV_DDLoading show];
//        [tableView.mj_footer resetNoMoreData];
//        NSDictionary *params = @{};
//        [weak_self.viewModel fetchData:params Completion:^(BOOL b, NSString *msg) {
//            //            [SV_DDLoading dismiss];
//            UITableView * table = tableView;
//            [table.mj_header endRefreshing];
//            if(!b)
//                return ;
//            [weak_self updateFooterRefreshState:0];
//            [table reloadData];
//            [weak_self.tableView noDataShow:weak_self.viewModel.dataArr];
//        }];
//    }];
//
//    //mj_footer 上拉加载
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        [weak_self.viewModel fetchNextPageDataCompletion:^(BOOL b, NSString *msg) {
//            UITableView * table = tableView;
//
//            [weak_self updateFooterRefreshState:0];
//            [tableView reloadData];
//        }];
//
//    }];
//    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
//    [tableView setMj_footer:footer];
//    [tableView.mj_footer setHidden:YES];
//
//
//}
//- (void)updateFooterRefreshState:(NSInteger)status{
//
//
//    UITableView * table = self.tableView;
//        JYCommentListViewModel *m =  self.viewModel;
//            if (m.hasMore == NO) {
//                [table.mj_footer setHidden:YES];
//            } else {
//                [table.mj_footer setHidden:NO];
//            }
//
//}

-(void)backHandle:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIView *)navBackgroundView
{
    if (!_navBackgroundView) {
        _navBackgroundView = [UIImageView new];
        _navBackgroundView.height = NavHeight;
        _navBackgroundView.width = UIScreenWidth;
        _navBackgroundView.backgroundColor = UIColorFromRGB(0xffffff);
        //        [(UIImageView *)_navBackgroundView setImage:[UIImage imageNamed:@"daohanlan"]];
    }
    return _navBackgroundView;
}


-(JYTeacherListViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [JYTeacherListViewModel new];
    }
    return _viewModel;
}


#pragma mark - Get
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, self.view.width, self.view.height - NavHeight - FootHeight) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        CGFloat contentInsetTop = 10.f;
        _tableView.contentInset = UIEdgeInsetsMake(contentInsetTop, 0, 10, 0);
        _tableView.backgroundColor  = [UIColor clearColor];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        
    }
    return _tableView;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //    self.navigationController.navigationBar
    if (@available(iOS 11.0, *)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 1;
}


#pragma mark - UITableViewDelegate

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *v = [UIView new];
    v.backgroundColor = UIColorFromRGB(0xffffff);
    return v;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  

    UIView *v = [UIView new];
    v.backgroundColor = UIColorFromRGB(0xffffff);
    return v;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     
    return 0.000001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //获取评论对象中的高度
    return   180;// [self.viewModel getCommentHeight:indexPath];
    //        return 129;
    
    //    return 115.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    JYTeacherInfoViewController *vc = [JYTeacherInfoViewController new];
    vc.model = self.viewModel.dataArr[indexPath.row];
    vc.ID = @"";
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}




#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.viewModel.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    JYTeacherInfoModel *m = self.viewModel.dataArr[indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTeacherListTableViewCell"];
    if (!cell) {
        [tableView registerClass:[JYTeacherListTableViewCell class] forCellReuseIdentifier:@"JYTeacherListTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTeacherListTableViewCell"];
    }
    NSDictionary *dic = [m getDic];
    [(JYTeacherListTableViewCell*)cell refresh:dic];
    //                 cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
