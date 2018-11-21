//
    //  SettingViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYSettingViewController.h"
#import "JYSettingViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYVideoSetTableViewCell.h"
#import "JYTitleSwitchTableViewCell.h"
#import "JYCacheTableViewCell.h"
#import "JYAboutTableViewCell.h"

@interface JYSettingViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYSettingViewModel *viewModel;

@end
@implementation JYSettingViewController
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
        return 45;
    }
    else  if(indexPath.row == 1)
    {
        return 45;
    }
    else  if(indexPath.row == 2)
    {
        return 45;
    }
    else  if(indexPath.row == 3)
    {
        return 45;
    }
    else  if(indexPath.row == 4)
    {
        return 45;
    }
    else
    {
        return 45;
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYVideoSetTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYVideoSetTableViewCell class] forCellReuseIdentifier:@"JYVideoSetTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYVideoSetTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYVideoSetTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleSwitchTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTitleSwitchTableViewCell class] forCellReuseIdentifier:@"JYTitleSwitchTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleSwitchTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTitleSwitchTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleSwitchTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTitleSwitchTableViewCell class] forCellReuseIdentifier:@"JYTitleSwitchTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleSwitchTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTitleSwitchTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 3)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleSwitchTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTitleSwitchTableViewCell class] forCellReuseIdentifier:@"JYTitleSwitchTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleSwitchTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTitleSwitchTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 4)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYCacheTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYCacheTableViewCell class] forCellReuseIdentifier:@"JYCacheTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYCacheTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYCacheTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYAboutTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYAboutTableViewCell class] forCellReuseIdentifier:@"JYAboutTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYAboutTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYAboutTableViewCell*)cell refresh:dic];
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