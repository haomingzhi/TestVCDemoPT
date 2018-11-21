//
    //  ClassInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYClassInfoViewController.h"
#import "JYClassInfoViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYClassImgTableViewCell.h"
#import "JYClassBarTableViewCell.h"
#import "JYClassTabsTableViewCell.h"

@interface JYClassInfoViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYClassInfoViewModel *viewModel;

@end
@implementation JYClassInfoViewController
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
        return 264;
    }
    else  if(indexPath.row == 1)
    {
        return 40;
    }
    else
    {
        return 300;
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassImgTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYClassImgTableViewCell class] forCellReuseIdentifier:@"JYClassImgTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassImgTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYClassImgTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassBarTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYClassBarTableViewCell class] forCellReuseIdentifier:@"JYClassBarTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassBarTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYClassBarTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassTabsTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYClassTabsTableViewCell class] forCellReuseIdentifier:@"JYClassTabsTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassTabsTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYClassTabsTableViewCell*)cell refresh:dic];
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