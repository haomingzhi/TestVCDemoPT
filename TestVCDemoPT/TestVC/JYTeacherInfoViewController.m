//
//  JYTeacherInfoViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherInfoViewController.h"
#import "UIButton+JYStyle.h"
#import "UIView+JYLayerEdit.h"
#import "UILabel+JYStyle.h"
#import "JYTeacherInfoViewModel.h"
#import "UIImage+JYEdit.h"
#import "JYTitleView.h"
#import "JYBigTitleTableViewCell.h"
#import "JYTitleTableViewCell.h"
#import "JYJobTableViewCell.h"
#import "JYGoodAtTableViewCell.h"
#import "JYHistoryTableViewCell.h"
#import "JYTeacherSayTableViewCell.h"
#import "JYZxWayTableViewCell.h"
#import "JYCommentTableViewCell.h"
#import "JYImgTableViewCell.h"
#import "JYTeacherHistoryViewController.h"
#import "JYCommentListViewController.h"
#import "JYNavView.h"
#import "UITableView+JYTool.h"
#import "DDExNoDataView.h"
#define ImgHeigth  (UIScreenWidth) * (160/375.0)

@interface JYTeacherInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYTeacherInfoViewModel *viewModel;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)JYNavView *navBackgroundView;
@property(nonatomic,strong)JYTitleView *commentTitleView;
@property(nonatomic,strong)UIButton *moreCommentBtn;
@end

@implementation JYTeacherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage  imageWithColor:UIColorFromRGBA(0x8B80F1, 0)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    if (self.model) {
        self.viewModel.model = self.model;
    }
    UIButton *backBtn = [UIButton newNavBackBtn:1];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.view.backgroundColor = UIColorFromRGB(0xF1F2F5);
    UILabel *tv = [UILabel newNavTitleLb:self.viewModel.model.name];
    tv.textColor = UIColorFromRGB(0xffffff);
    self.navigationItem.titleView = tv;
    
//    UIButton *rBtn = [UIButton newNavShareBtn:1];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rBtn];
    [backBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
//    [rBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.navBackgroundView];
    self.navigationController.navigationBar.translucent = YES;
    if (self.ID) {
         [self fetchData];
    }
    
}

-(void)ApplicationDidBecomeActive
{
    CGFloat xm = ImgHeigth  - NavHeight;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGBA(0x8B80F1, 0)] forBarMetrics:UIBarMetricsDefault];
    self.navBackgroundView.alpha = 1 - (xm - self.tableView.contentOffset.y + 20)/xm;
    self.navigationController.navigationBar.alpha = (xm - self.tableView.contentOffset.y + 20)/xm;
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
        UILabel *tv = [UILabel newNavTitleLb:weak_self.viewModel.model.name];
        tv.textColor = UIColorFromRGB(0xffffff);
        weak_self.navigationItem.titleView = tv;
        [weak_self.navBackgroundView setTitle:weak_self.viewModel.model.name];
         weak_self.commentTitleView.title = [NSString stringWithFormat:@"家长评价(%@)",@(self.viewModel.commentList.count)];
          [weak_self.moreCommentBtn setCommentBtn:self.viewModel.commentList.count];
        [weak_self.tableView reloadData];
        
    }];
}

-(JYTitleView *)commentTitleView
{
    if (!_commentTitleView) {
        _commentTitleView = [JYTitleView newTitleView:@"家长评价(0)"];
       
        _commentTitleView.height = 46;
        _commentTitleView.width = UIScreenWidth;
       
    }
    _commentTitleView.titleLb.top = 15;
    _commentTitleView.titleLb.left = 17.5;
    return _commentTitleView;
}

-(UIButton *)moreCommentBtn
{
    if (!_moreCommentBtn) {
        _moreCommentBtn = [UIButton newCommentBtn:0];
      
        [_moreCommentBtn addTarget:self action:@selector(gotoMoreComment) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreCommentBtn;
}

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.width = UIScreenWidth;
        _bottomView.height = 44;
        _bottomView.top = UIScreenHeight - FootHeight - _bottomView.height;
        UIButton *aBtn = [UIButton newZxKfBtn];
        aBtn.left = 0;
        aBtn.backgroundColor = UIColorFromRGB(0xffffff);
        [_bottomView addSubview:aBtn];
        [aBtn addTarget:self action:@selector(kefuHandle:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *bBtn = [UIButton newAskBtn];
        bBtn.left = 130;
        [_bottomView gradientColor:UIColorFromRGB(0xFFEF73) toColor:UIColorFromRGB(0xFDDA3F)];
        [bBtn addTarget:self action:@selector(teacherHandle:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:bBtn];
    }
    return _bottomView;
}

-(void)kefuHandle:(UIButton *)btn
{
    //去客服聊天窗
}

-(void)teacherHandle:(UIButton *)btn
{
   
    [self goToTeacherIM];
}

-(void)goToTeacherIM
{
     //去导师聊天窗
}

-(JYTeacherInfoViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [JYTeacherInfoViewModel new];
    }
    return _viewModel;
}

#pragma mark - Get
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, XNavTop, self.view.width, self.view.height - 44 - FootHeight - XNavTop) style:UITableViewStyleGrouped];
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


#pragma mark - UITableViewDelegate

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        if (self.viewModel.commentList.count == 0) {
            DDExNoDataView *nv = [[DDExNoDataView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, 200)];
            nv.tip = @"暂无数据";
            nv.imgV.height = 0;
            nv.imgV.top = 200/2.0 - nv.stateLb.height/2.0 - 20;
            return nv;
        }
        return self.moreCommentBtn;
    }
    if(section == 0)
    {
        UIView *v = [UIView new];
        v.backgroundColor = UIColorFromRGB(0xffffff);
        return v;
    }
    UIView *v = [UIView new];
    v.backgroundColor = UIColorFromRGB(0xF1F2F5);
    return v;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        if (self.viewModel.commentList.count == 0) {
            return 200;
        }
        return 40;
    }
    if(section == 0)
    {
        return 0.0001;
    }
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 4) {
        return self.commentTitleView;
    }
    
    UIView *v = [UIView new];
    v.backgroundColor = UIColorFromRGB(0xF1F2F5);
    return v;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 4) {
        return 46;
    }
    return 0.000001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 160/375.0 * UIScreenWidth;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            return 32;
        }
        else if (indexPath.row == 1)
        {
            //获取导师详情 职业高度
            return self.viewModel.jobHeight;
        }
       else if (indexPath.row == 2) {
           return 38;
        }
        else
        {
            return 40;
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 46;
        }
        else if (indexPath.row == 1)
        {
            //获取导师详情中的老师说内容高度
            return self.viewModel.teacherSayHeight;
        }
    }
    else if (indexPath.section == 3)
    {
        return 50;
    }
    else
    {
        //获取评论对象中的高度
      return   [self.viewModel getCommentHeight:indexPath];
//        return 129;
    }
    return 115.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 1 && indexPath.row == 3) {
        //去老师履历
        [self gotoLvLi];
    }
    else if(indexPath.section == 3)
    {
        [self goToTeacherIM];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
     return 1;
    }
    else if (section == 1)
    {
        return 4;
    }
    else if (section == 2)
    {
        return 2;
    }
    else if (section == 3)
    {
        return 1;
    }
    else
    {
        return  MIN(5, self.viewModel.commentList.count);
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYTeacherInfoModel *m = self.viewModel.model;
    UITableViewCell *cell;
    if (indexPath.section == 0) {
       cell = [tableView dequeueReusableCellWithIdentifier:@"JYImgTableViewCell"];
        if (!cell) {
            [tableView registerClass:[JYImgTableViewCell class] forCellReuseIdentifier:@"JYImgTableViewCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYImgTableViewCell"];
        }
        NSDictionary *dic = [m getDic:indexPath];
        [(JYImgTableViewCell*)cell refresh:dic];
//        cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYBigTitleTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYBigTitleTableViewCell class] forCellReuseIdentifier:@"JYBigTitleTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYBigTitleTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYBigTitleTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        }
        else if (indexPath.row == 1)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYJobTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYJobTableViewCell class] forCellReuseIdentifier:@"JYJobTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYJobTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYJobTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        }
        else if (indexPath.row ==2)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYGoodAtTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYGoodAtTableViewCell class] forCellReuseIdentifier:@"JYGoodAtTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYGoodAtTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYGoodAtTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYHistoryTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYHistoryTableViewCell class] forCellReuseIdentifier:@"JYHistoryTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYHistoryTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYHistoryTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        }
    }
    else
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYTitleTableViewCell class] forCellReuseIdentifier:@"JYTitleTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYTitleTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYTeacherSayTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYTeacherSayTableViewCell class] forCellReuseIdentifier:@"JYTeacherSayTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYTeacherSayTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYTeacherSayTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        }
    }
    else
        if (indexPath.section == 3) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYZxWayTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYZxWayTableViewCell class] forCellReuseIdentifier:@"JYZxWayTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYZxWayTableViewCell"];
            }
            NSDictionary *dic = [m getDic:indexPath];
            [(JYZxWayTableViewCell*)cell refresh:dic];
//             cell.separatorInset = UIEdgeInsetsMake(0, -10000, 0, 0);
        }
        else
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYCommentTableViewCell"];
                if (!cell) {
                    [tableView registerClass:[JYCommentTableViewCell class] forCellReuseIdentifier:@"JYCommentTableViewCell"];
                    cell = [tableView dequeueReusableCellWithIdentifier:@"JYCommentTableViewCell"];
                }
                NSDictionary *dic = [self.viewModel getCommentDic:indexPath];
                [(JYCommentTableViewCell*)cell refresh:dic];
//                 cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
            }
//    NSDictionary *member = @{@"img":@"高二成长档案",@"text":@"MBTI职业性格测试93题"};//self.members[indexPath.row];
    //[cell refresh:member];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(JYNavView *)navBackgroundView
{
    if (!_navBackgroundView) {
        _navBackgroundView = [JYNavView newNavView:@""];
       UIButton *lbtn = [_navBackgroundView setNavLeftBtn];
//        UIButton *rbtn = [_navBackgroundView setNavRightBtn];
        [lbtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
//            [rbtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
        _navBackgroundView.backgroundColor = UIColorFromRGB(0xffffff);
//        [(UIImageView *)_navBackgroundView setImage:[UIImage imageNamed:@"daohanlan"]];
    }
    return _navBackgroundView;
}

-(void)backHandle:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)shareHandle:(UIButton *)btn
{
    
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
//    self.navigationController.navigationBar.translucent = YES;
    CGFloat xm = ImgHeigth  - NavHeight;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGBA(0x8B80F1, 0)] forBarMetrics:UIBarMetricsDefault];
    self.navBackgroundView.alpha = 1 - (xm - self.tableView.contentOffset.y + 20)/xm;
   self.navigationController.navigationBar.alpha = (xm - self.tableView.contentOffset.y + 20)/xm;
//    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ApplicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
      [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        if (scrollView.contentOffset.y < 0) {
            return;
        }
        CGFloat xm = ImgHeigth  - NavHeight;
        self.navBackgroundView.alpha = 1 - (xm - scrollView.contentOffset.y + 20)/xm;
        self.navigationController.navigationBar.alpha = (xm - scrollView.contentOffset.y + 20)/xm;
//        if (scrollView.contentOffset.y <= -(NavHeight)) {
//            //            self.navBackgroundView.alpha = 1;
////            self.navigationItem.titleView.
//            self.navigationController.navigationBar.hidden = YES;
//        }
//        else if (scrollView.contentOffset.y >= 0)
//        {
//            self.navigationController.navigationBar.hidden = NO;
//        }
    
    }
}

-(void)gotoLvLi//去履历
{
    JYTeacherHistoryViewController *vc = [JYTeacherHistoryViewController new];
    vc.viewModel = self.viewModel;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)gotoMoreComment//去更多评价
{
    JYCommentListViewController *vc = [JYCommentListViewController new];
//    vc.ID = self.viewModel.
    [self.navigationController pushViewController:vc animated:YES];
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
