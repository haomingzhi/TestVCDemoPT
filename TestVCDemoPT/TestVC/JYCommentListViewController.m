//
//  JYCommentListViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYCommentListViewController.h"
#import "JYCommentTableViewCell.h"
#import "JYCommentListViewModel.h"
#import "UIButton+JYStyle.h"
#import "JYNavView.h"
#import "UITableView+JYTool.h"
#import "CustomRefreshGifHeader.h"
@interface JYCommentListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYCommentListViewModel *viewModel;
@property(nonatomic,strong)JYNavView *navBackgroundView;
@end

@implementation JYCommentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColorFromRGB(0xffffff);
//    self.title = @"家长评论";
//    UIButton *backBtn = [UIButton newNavBackBtn:0];
//    [backBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.navBackgroundView];
    self.navigationItem.leftBarButtonItem = nil;//[[UIBarButtonItem alloc] initWithCustomView:backBtn];
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.tableView];
    self.navigationController.navigationBar.alpha = 0;
    [self setTable];
    [self.tableView.mj_header beginRefreshing];
//    [self fetchData];
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
-(void)setTable
{
    __weak typeof(self) weak_self = self;
    //下拉刷新
    __weak UITableView *tableView = self.tableView;
    tableView.mj_header = [CustomRefreshGifHeader headerWithRefreshingBlock:^{
        //        [SV_DDLoading show];
        [tableView.mj_footer resetNoMoreData];
        NSDictionary *params = @{};
        [weak_self.viewModel fetchData:params Completion:^(BOOL b, NSString *msg) {
            //            [SV_DDLoading dismiss];
            UITableView * table = tableView;
            [table.mj_header endRefreshing];
            if(!b)
                return ;
            [weak_self updateFooterRefreshState:0];
            [table reloadData];
            [weak_self.tableView noDataShow:weak_self.viewModel.dataArr];
        }];
    }];

    //mj_footer 上拉加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weak_self.viewModel fetchNextPageDataCompletion:^(BOOL b, NSString *msg) {
            if (b) {
                if (!weak_self.viewModel.hasMore) {
                    [tableView.mj_footer endRefreshingWithNoMoreData];
                } else {
                    [tableView.mj_footer endRefreshing];
                }
            } else {
//                if (![XTool isStringEmpty:msg]) {
//                    [SV_DDLoading showMessage:msg];
//                    //                    [SV_DDLoading dismissWithDelay:1];
//                }
//                [table.mj_footer endRefreshing];
            }
            [weak_self updateFooterRefreshState:0];
            [tableView reloadData];
        }];
    }];
    
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [tableView setMj_footer:footer];
    [tableView.mj_footer setHidden:YES];
}

- (void)updateFooterRefreshState:(NSInteger)status{
    UITableView * table = self.tableView;
    JYCommentListViewModel *m = self.viewModel;
        if (m.hasMore == NO)
        {
            [table.mj_footer setHidden:YES];
        }
        else
        {
            [table.mj_footer setHidden:NO];
        }
}

-(void)backHandle:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(JYNavView *)navBackgroundView
{
    if (!_navBackgroundView) {
        _navBackgroundView = [JYNavView newNavView:@"家长评论"];
        UIButton *lbtn = [_navBackgroundView setNavLeftBtn];
//        UIButton *rbtn = [_navBackgroundView setNavRightBtn];
        [lbtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
//        [rbtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
        _navBackgroundView.backgroundColor = UIColorFromRGB(0xffffff);
        //        [(UIImageView *)_navBackgroundView setImage:[UIImage imageNamed:@"daohanlan"]];
    }
    return _navBackgroundView;
}

//
//-(void)shareHandle:(UIButton *)btn
//{
//
//}


-(JYCommentListViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [JYCommentListViewModel new];
    }
    return _viewModel;
}


#pragma mark - Get
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, self.view.width, self.view.height - NavHeight - FootHeight) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        CGFloat contentInsetTop = 0.f;
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
}


#pragma mark - UITableViewDelegate

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    if (section == 4) {
//        return self.moreCommentBtn;
//    }
//    if(section == 0)
//    {
//        UIView *v = [UIView new];
//        v.backgroundColor = UIColorFromRGB(0xffffff);
//        return v;
//    }
//    UIView *v = [UIView new];
//    v.backgroundColor = UIColorFromRGB(0xF1F2F5);
//    return v;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section == 4) {
//        return 40;
//    }
//    if(section == 0)
//    {
//        return 0.0001;
//    }
//    return 10;
//}
//
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
     return    [self.viewModel getCommentHeight:indexPath];
        //        return 129;
    
//    return 115.f;
}

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.viewModel.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    JYCommentModel *m = self.viewModel.dataArr[indexPath.row];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYCommentTableViewCell"];
                if (!cell) {
                    [tableView registerClass:[JYCommentTableViewCell class] forCellReuseIdentifier:@"JYCommentTableViewCell"];
                    cell = [tableView dequeueReusableCellWithIdentifier:@"JYCommentTableViewCell"];
                }
    NSDictionary *dic = [m getDic];//@{@"title":@"你怎样度过自己的一生？我从来不把安逸和享乐看作是生活目的本身。非",@"name":@"排班密码",@"time":@"2018-09-22",@"img":@"",@"point":@""};
                [(JYCommentTableViewCell*)cell refresh:dic];
                //                 cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
    
  
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
