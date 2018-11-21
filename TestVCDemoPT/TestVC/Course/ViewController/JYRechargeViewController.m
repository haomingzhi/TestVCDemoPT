//
    //  RechargeViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYRechargeViewController.h"
#import "JYRechargeViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYcheckMoneyTableViewCell.h"
#import "JYPayTableViewCell.h"
#import "JYPayBtnTableViewCell.h"
#import "JYPayTitleTableViewCell.h"
#import "JYPayTipTableViewCell.h"


@interface JYRechargeViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYRechargeViewModel *viewModel;

@end

@implementation JYRechargeViewController
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
     if(indexPath.section == 0)
    {
        return 285;
    }
    else
    {
         if(indexPath.row == 0)
    {
        return 44;
    }
    else  if(indexPath.row == 1)
    {
        return 44;
    }
    else  if(indexPath.row == 2)
    {
        return 67;
    }
    else  if(indexPath.row == 3)
    {
        return 34;
    }
    else
    {
        return 68;
    }
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
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     if(section == 0)
    {
        return 1;
    }
    else
    {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     if(indexPath.section == 0)
    {
      cell = [tableView dequeueReusableCellWithIdentifier:@"JYcheckMoneyTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYcheckMoneyTableViewCell class] forCellReuseIdentifier:@"JYcheckMoneyTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYcheckMoneyTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYcheckMoneyTableViewCell*)cell refresh:dic];
;
    }
        else
    {
      if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYPayTableViewCell class] forCellReuseIdentifier:@"JYPayTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYPayTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYPayTableViewCell class] forCellReuseIdentifier:@"JYPayTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYPayTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayBtnTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYPayBtnTableViewCell class] forCellReuseIdentifier:@"JYPayBtnTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayBtnTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYPayBtnTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 3)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTitleTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYPayTitleTableViewCell class] forCellReuseIdentifier:@"JYPayTitleTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTitleTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYPayTitleTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTipTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYPayTipTableViewCell class] forCellReuseIdentifier:@"JYPayTipTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYPayTipTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYPayTipTableViewCell*)cell refresh:dic];
    };
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
