//
    //  TrainingInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYTrainingInfoViewController.h"
#import "JYTrainingInfoViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYTrainingImgTableViewCell.h"
#import "JYTrainingBarTableViewCell.h"
#import "JYTrainingTabsTableViewCell.h"


@interface JYTrainingInfoViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYTrainingInfoViewModel *viewModel;

@end

@implementation JYTrainingInfoViewController
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
        return 265;
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
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTrainingImgTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTrainingImgTableViewCell class] forCellReuseIdentifier:@"JYTrainingImgTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTrainingImgTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTrainingImgTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTrainingBarTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTrainingBarTableViewCell class] forCellReuseIdentifier:@"JYTrainingBarTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTrainingBarTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTrainingBarTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTrainingTabsTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYTrainingTabsTableViewCell class] forCellReuseIdentifier:@"JYTrainingTabsTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYTrainingTabsTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYTrainingTabsTableViewCell*)cell refresh:dic];
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
