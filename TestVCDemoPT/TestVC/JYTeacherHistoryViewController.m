//
//  JYTeacherHistoryViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherHistoryViewController.h"
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
#import "JYImgTableViewCell.h"
#import "JYCommentTableViewCell.h"
#import "JYHtmlTableViewCell.h"
#import "JYNavView.h"
#define ImgHeigth2  (UIScreenWidth) * (160/375.0)

@interface JYTeacherHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)JYNavView *navBackgroundView;
@end

@implementation JYTeacherHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage  imageWithColor:UIColorFromRGBA(0x8B80F1, 0)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    UIButton *backBtn = [UIButton newNavBackBtn:1];
    [backBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.view.backgroundColor = UIColorFromRGB(0xF1F2F5);
   UILabel *tv = [UILabel newNavTitleLb:@"导师履历"];
    tv.textColor = UIColorFromRGB(0xffffff);
    self.navigationItem.titleView = tv;
    UIButton *rBtn = [UIButton newNavShareBtn:1];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rBtn];
     [rBtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:[UIView new]];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navBackgroundView];
}
-(void)backHandle:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, XNavTop, self.view.width, self.view.height - FootHeight - XNavTop) style:UITableViewStyleGrouped];
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
   
    if(section == 0)
    {
        return 0.0001;
    }
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  
    UIView *v = [UIView new];
    v.backgroundColor = UIColorFromRGB(0xF1F2F5);
    return v;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
 
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
        
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 40;
        }
        else if (indexPath.row == 1)
        {
            //获取导师详情中的个人简介内容高度
            return self.viewModel.teacherIntroHeight;
        }
    }
    else
    {
        if (indexPath.row == 0) {
            return 40;
        }
        else if (indexPath.row == 1)
        {
            //获取导师详情中的个人简介内容高度
            return self.viewModel.teacherStoryHeight;
        }
    }
    
    return 115.f;
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return 3;
    }
    else if (section == 2)
    {
        return 2;
    }
    else
    {
        return 2;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYImgTableViewCell"];
        if (!cell) {
            [tableView registerClass:[JYImgTableViewCell class] forCellReuseIdentifier:@"JYImgTableViewCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYImgTableViewCell"];
        }
        [(JYImgTableViewCell*)cell refresh:@{@"img":@""}];
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
            NSDictionary *dic = @{@"title":@"林佳"};
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
            NSDictionary *dic = @{@"title":@"师范大学心理学教授\n\
中国职业规划师\n\
校园在线教育顾问"};
            [(JYJobTableViewCell*)cell refresh:dic];
            //             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYGoodAtTableViewCell"];
            if (!cell) {
                [tableView registerClass:[JYGoodAtTableViewCell class] forCellReuseIdentifier:@"JYGoodAtTableViewCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYGoodAtTableViewCell"];
            }
            NSDictionary *dic = @{@"title":@"擅长：升学、选科、志愿填报",@"hiddenLine":@YES};
            [(JYGoodAtTableViewCell*)cell refresh:dic];
            //             cell.separatorInset = UIEdgeInsetsMake(0, 17.5, 0, 17.5);
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
                NSDictionary *dic = @{@"title":@"个人简介"};
                [(JYTitleTableViewCell*)cell refresh:dic];
                //             cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
            }
            else
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"JYHtmlTableViewCell"];
                if (!cell) {
                    [tableView registerClass:[JYHtmlTableViewCell class] forCellReuseIdentifier:@"JYHtmlTableViewCell"];
                    cell = [tableView dequeueReusableCellWithIdentifier:@"JYHtmlTableViewCell"];
                }
                NSDictionary *dic = @{@"title":@"“我一共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个孩子出国深造，相信你的孩子也能！”"};
                [(JYHtmlTableViewCell*)cell refresh:dic];
                [(JYHtmlTableViewCell*)cell setCallBack:^(NSDictionary * _Nonnull dic) {
                    CGFloat h = [dic[@"H"] floatValue];
                    weak_self.viewModel.teacherIntroHeight = h;
                    [weak_self.tableView beginUpdates];
                    [weak_self.tableView endUpdates];
                }];
            }
        }
        else
      {
                if (indexPath.row == 0) {
                    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTableViewCell"];
                    if (!cell) {
                        [tableView registerClass:[JYTitleTableViewCell class] forCellReuseIdentifier:@"JYTitleTableViewCell"];
                        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTableViewCell"];
                    }
                    NSDictionary *dic = @{@"title":@"老师故事"};
                    [(JYTitleTableViewCell*)cell refresh:dic];
                  
                }
                else
                {
                                    cell = [tableView dequeueReusableCellWithIdentifier:@"JYHtmlTableViewCell"];
                                    if (!cell) {
                                        [tableView registerClass:[JYHtmlTableViewCell class] forCellReuseIdentifier:@"JYHtmlTableViewCell"];
                                        cell = [tableView dequeueReusableCellWithIdentifier:@"JYHtmlTableViewCell"];
                                    }
                                    NSDictionary *dic = @{@"title":@"我一共带过630个孩子填报志愿，其中450个孩子考上了比原定目标更好的大学，180个孩子出国深造，相信你的孩子也能！我为您探索微信小程序用户的认知、行为特点，及对未来小程序的使用诉求等。"};
                                    [(JYHtmlTableViewCell*)cell refresh:dic];
                    [(JYHtmlTableViewCell*)cell setCallBack:^(NSDictionary * _Nonnull dic) {
                        CGFloat h = [dic[@"H"] floatValue];
                        weak_self.viewModel.teacherStoryHeight = h;
                        [weak_self.tableView beginUpdates];
                        [weak_self.tableView endUpdates];
                    }];
                }
            }
    
    //    NSDictionary *member = @{@"img":@"高二成长档案",@"text":@"MBTI职业性格测试93题"};//self.members[indexPath.row];
    //[cell refresh:member];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(JYNavView *)navBackgroundView
{
    if (!_navBackgroundView) {
        _navBackgroundView = [JYNavView newNavView:@"导师履历"];
        UIButton *lbtn = [_navBackgroundView setNavLeftBtn];
        UIButton *rbtn = [_navBackgroundView setNavRightBtn];
        [lbtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
        [rbtn addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
        _navBackgroundView.backgroundColor = UIColorFromRGB(0xffffff);
        //        [(UIImageView *)_navBackgroundView setImage:[UIImage imageNamed:@"daohanlan"]];
    }
    return _navBackgroundView;
}

 

-(void)shareHandle:(UIButton *)btn
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [self.leftMenuDialogView addToWindow];
    //    self.navigationItem.leftBarButtonItem = nil;
    self.navigationController.navigationBar.translucent = YES;
    
    //    self.navigationController.navigationBar.hidden = YES;
    CGFloat xm = ImgHeigth2  - NavHeight;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGBA(0x8B80F1, 0)] forBarMetrics:UIBarMetricsDefault];
    self.navBackgroundView.alpha = 1 - (xm - self.tableView.contentOffset.y + 20)/xm;
    
    [self.tableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        if (scrollView.contentOffset.y < 0) {
            return;
        }
        CGFloat xm = ImgHeigth2  - NavHeight;
        //        if(scrollView.contentOffset.y > xm)
        //        {
        self.navBackgroundView.alpha = 1 - (xm - scrollView.contentOffset.y + 20)/xm;
         self.navigationController.navigationBar.alpha = (xm - scrollView.contentOffset.y + 20)/xm;
//        if (scrollView.contentOffset.y <= -(NavHeight)) {
//            //            self.navBackgroundView.alpha = 1;
//            self.navigationController.navigationBar.hidden = YES;
//        }
//        else if (scrollView.contentOffset.y >= 0)
//        {
//            self.navigationController.navigationBar.hidden = NO;
//        }
        
    }
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
@end
