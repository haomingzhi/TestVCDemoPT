//
    //  ClassBuyViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYClassBuyViewController.h"
#import "JYClassBuyViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYBuyTagTableViewCell.h"
#import "JYBuyTitleTableViewCell.h"
#import "JYBuyInfoTableViewCell.h"
#import "JYBuyTipTableViewCell.h"

@interface JYClassBuyViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYClassBuyViewModel *viewModel;

@end
@implementation JYClassBuyViewController
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
        return 46;
    }
    else  if(indexPath.row == 1)
    {
        return 55;
    }
    else  if(indexPath.row == 2)
    {
        return 90;
    }
    else
    {
        return 30;
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
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyTagTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYBuyTagTableViewCell class] forCellReuseIdentifier:@"JYBuyTagTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyTagTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYBuyTagTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyTitleTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYBuyTitleTableViewCell class] forCellReuseIdentifier:@"JYBuyTitleTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyTitleTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYBuyTitleTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyInfoTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYBuyInfoTableViewCell class] forCellReuseIdentifier:@"JYBuyInfoTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyInfoTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYBuyInfoTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyTipTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYBuyTipTableViewCell class] forCellReuseIdentifier:@"JYBuyTipTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYBuyTipTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYBuyTipTableViewCell*)cell refresh:dic];
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