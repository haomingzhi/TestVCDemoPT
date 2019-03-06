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
@interface JYTeacherListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYTeacherListViewModel *viewModel;

@property(nonatomic,strong)UIView *navBackgroundView;
@end

@implementation JYTeacherListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
   self.navigationItem.titleView = [UILabel newNavTitleLb:@"选科、志愿、升学咨询"];
    UIButton *backBtn = [UIButton newNavBackBtn:0];
    [backBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.navBackgroundView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.tableView];
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
    return   180;// [self.viewModel getCommentHeight:indexPath];
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
    
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTeacherListTableViewCell"];
    if (!cell) {
        [tableView registerClass:[JYTeacherListTableViewCell class] forCellReuseIdentifier:@"JYTeacherListTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTeacherListTableViewCell"];
    }
    NSDictionary *dic = @{@"job":@"师范大学心理学教授、中国职业规划师",@"name":@"排班密码",@"goodAt":@"擅长：学科选择、志愿填报",@"img":@"",@"zx":@"323次咨询",@"mark":@[@"强力推荐"],@"infoMark":@[@"15分钟恢复",@"名师"]};
    [(JYTeacherListTableViewCell*)cell refresh:dic];
    //                 cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
