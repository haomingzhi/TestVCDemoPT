//
    //  DirectViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYDirectViewController.h"
#import "JYDirectViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYDirctTableViewCell.h"
#import "JYDirectHeadView.h"
@interface JYDirectViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYDirectViewModel *viewModel;
//@property(nonatomic,strong)JYDirectHeadView *headView;
@property(nonatomic,strong)UIButton *bottomBtn;
@end
@implementation JYDirectViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.bottomBtn];
    [self.view addSubview:self.tableView];

}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 41;
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
    return 41;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //    UIView *v = [UIView new];
    //    v.backgroundColor = UIColorFromRGB(0xF9F9F9);
   JYDirectHeadView *headView = [JYDirectHeadView new];
    headView.title = @"第一篇 关于本篇";
    return headView;
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
     cell = [tableView dequeueReusableCellWithIdentifier:@"JYDirctTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYDirctTableViewCell class] forCellReuseIdentifier:@"JYDirctTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYDirctTableViewCell"];
    }
    NSDictionary *dic = @{@"type":@"视频",@"title":@"关于本篇"};
        [(JYDirctTableViewCell*)cell refresh:dic];

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

//-(JYDirectHeadView *)headView
//{
//    if (!_headView) {
//        _headView = [JYDirectHeadView new];
//        _headView.title = @"第一篇 关于本篇";
//    }
//    return _headView;
//}

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
