//
    //  IntroViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYIntroViewController.h"
#import "JYIntroViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYIntroHeadTableViewCell.h"
#import "JYIntroTitleTableViewCell.h"
#import "JYIntroContentTableViewCell.h"
#import "JYIntroImgTableViewCell.h"

@interface JYIntroViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYIntroViewModel *viewModel;
@property(nonatomic,strong)UIButton *bottomBtn;
@end
@implementation JYIntroViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    [self.view addSubview:self.bottomBtn];
    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.tableView];

}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if(indexPath.row == 0)
    {
        return 89;
    }
    else  if(indexPath.row == 1)
    {
        return 45;
    }
    else  if(indexPath.row == 2)
    {
        return 123;
    }
    else
    {
        return 175;
    }
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroHeadTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYIntroHeadTableViewCell class] forCellReuseIdentifier:@"JYIntroHeadTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroHeadTableViewCell"];
    }
        NSDictionary *dic = @{@"title":@"高二英语重点知识点测试",@"info":@"1000人在线",@"count":@"20人",@"price":@"¥4354.00",@"star":@"4.0",@"img":@"限制"};
        [(JYIntroHeadTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroTitleTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYIntroTitleTableViewCell class] forCellReuseIdentifier:@"JYIntroTitleTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroTitleTableViewCell"];
    }
        NSDictionary *dic = @{@"title":@"课程介绍"};
        [(JYIntroTitleTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroContentTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYIntroContentTableViewCell class] forCellReuseIdentifier:@"JYIntroContentTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroContentTableViewCell"];
    }
        NSDictionary *dic = @{@"title":@"看来是假的；弗兰克独家发售三顿饭就撒开了大幅减少大幅拉升开飞机拉屎的肌肤啊收拾了房间里看得舒服啊啥地方；家里的 v"};
        [(JYIntroContentTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroImgTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYIntroImgTableViewCell class] forCellReuseIdentifier:@"JYIntroImgTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYIntroImgTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYIntroImgTableViewCell*)cell refresh:dic];
    }
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
-(UIButton*)bottomBtn
{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton new];
        _bottomBtn.height = 41;
        _bottomBtn.width = UIScreenWidth - 30;
        _bottomBtn.layer.cornerRadius = _bottomBtn.height/2.0;
        _bottomBtn.layer.masksToBounds = YES;
        _bottomBtn.backgroundColor = UIColorFromRGB(0x8b80f1);
        [_bottomBtn setTitleColor:UIColorFromRGB(0xf6f6f6) forState:UIControlStateSelected];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _bottomBtn.left = 15;
        [_bottomBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        _bottomBtn.top = self.view.height - 66;
    }
    return _bottomBtn;
}

@end
