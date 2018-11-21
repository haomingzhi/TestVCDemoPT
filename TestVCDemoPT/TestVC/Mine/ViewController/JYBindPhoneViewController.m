//
    //  BindPhoneViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYBindPhoneViewController.h"
#import "JYBindPhoneViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYBindTipTableViewCell.h"
#import "JYPhoneTableViewCell.h"
#import "JYCodeTableViewCell.h"
#import "JYBindBtnTableViewCell.h"

@interface JYBindPhoneViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYBindPhoneViewModel *viewModel;

@end
@implementation JYBindPhoneViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.tableView];

}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if(indexPath.row == 0)
    {
        return 75;
    }
    else  if(indexPath.row == 1)
    {
        return 45;
    }
    else  if(indexPath.row == 2)
    {
        return 45;
    }
    else
    {
        return 92;
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
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYBindTipTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYBindTipTableViewCell class] forCellReuseIdentifier:@"JYBindTipTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYBindTipTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYBindTipTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPhoneTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYPhoneTableViewCell class] forCellReuseIdentifier:@"JYPhoneTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYPhoneTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYPhoneTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYCodeTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYCodeTableViewCell class] forCellReuseIdentifier:@"JYCodeTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYCodeTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYCodeTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYBindBtnTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYBindBtnTableViewCell class] forCellReuseIdentifier:@"JYBindBtnTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYBindBtnTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYBindBtnTableViewCell*)cell refresh:dic];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UITableView *)tableView
{
    if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, self.view.width, self.view.height - NavHeight) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CGFloat contentInsetTop = 10.f;
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