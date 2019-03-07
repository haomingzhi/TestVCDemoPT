//
//  JYSearchZxViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYSearchZxViewController.h"
#import "UIButton+JYStyle.h"
#import "UILabel+JYStyle.h"
#import "JYTitleView.h"
#import "JYTeacherListViewModel.h"
#import "JYSoonAskTableViewCell.h"
#import "JYSearchTipTableViewCell.h"
#import "JYSearchTypeTableViewCell.h"
#import "JYTeacherListViewController.h"
#import "JYSearchZxViewModel.h"
#import "JYTeacherTypeModel.h"
@interface JYSearchZxViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYSearchZxViewModel *viewModel;

@property(nonatomic,strong)UIView *navBackgroundView;
@end

@implementation JYSearchZxViewController

- (void)viewDidLoad {
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    self.navigationItem.titleView = [UILabel newNavTitleLb:@"我的咨询"];
    UIButton *backBtn = [UIButton newNavBackBtn:0];
    [backBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.navBackgroundView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.tableView];
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
        
    }];
}
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


-(JYSearchZxViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [JYSearchZxViewModel new];
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
    
    if (section == 0) {
        JYTitleView *v = [JYTitleView newTitleView:@"快速问"];
        v.height = 45;
        v.titleLb.top = 14;
         v.titleLb.left = 17.5;
        return v;
    }
    else
    {
        JYTitleView *v = [JYTitleView newTitleView:@"找老师"];
        v.height = 45;
        v.titleLb.top = 14;
        v.titleLb.left = 17.5;
        return v;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 52;
        }
        else
        {
            return 40;
        }
    }
    else
    {
        return 95;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 && indexPath.row == 0) {
         //去客服聊天窗提问
        
    }
    else
    if (indexPath.section == 1) {
        JYTeacherTypeModel *m = self.viewModel.dataArr[indexPath.row];
        JYTeacherListViewController *vc = [JYTeacherListViewController new];
        vc.title = m.type;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}




#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 2;
    return self.viewModel.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYTeacherTypeModel *m = self.viewModel.dataArr[indexPath.row];
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYSoonAskTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYSoonAskTableViewCell class] forCellReuseIdentifier:@"JYSoonAskTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYSoonAskTableViewCell"];
            }
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYSearchTipTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYSearchTipTableViewCell class] forCellReuseIdentifier:@"JYSearchTipTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYSearchTipTableViewCell"];
            }
            [(JYSearchTipTableViewCell*)cell refresh:@{}];
        }
    }
    else
    {
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYSearchTypeTableViewCell"];
    if (!cell) {
        [tableView registerClass:[JYSearchTypeTableViewCell class] forCellReuseIdentifier:@"JYSearchTypeTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYSearchTypeTableViewCell"];
    }
        NSDictionary *dic = [m getDic];//@{@"title":@"选科、志愿、升学",@"level":@"志愿填报专家",@"img":@""};
    [(JYSearchTypeTableViewCell*)cell refresh:dic];
    //                 cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
    
    }
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
