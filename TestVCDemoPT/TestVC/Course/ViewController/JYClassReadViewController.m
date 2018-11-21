//
    //  ClassReadViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYClassReadViewController.h"
#import "JYClassReadViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYClassImgsTableViewCell.h"
#import "JYClassReadBarTableViewCell.h"
#import "JYClassReadTestTableViewCell.h"
#import "JYClassReadInfoTableViewCell.h"

@interface JYClassReadViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYClassReadViewModel *viewModel;

@end
@implementation JYClassReadViewController
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
         if(indexPath.row == 0)
    {
        return 201;
    }
    else
    {
        return 75;
    }
    }
    else
    {
         if(indexPath.row == 0)
    {
        return 56;
    }
    else
    {
        return 130;
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
        return 2;
    }
    else
    {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     if(indexPath.section == 0)
    {
      if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassImgsTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYClassImgsTableViewCell class] forCellReuseIdentifier:@"JYClassImgsTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassImgsTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYClassImgsTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassReadBarTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYClassReadBarTableViewCell class] forCellReuseIdentifier:@"JYClassReadBarTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassReadBarTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYClassReadBarTableViewCell*)cell refresh:dic];
    };
    }
        else
    {
      if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassReadTestTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYClassReadTestTableViewCell class] forCellReuseIdentifier:@"JYClassReadTestTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassReadTestTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYClassReadTestTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassReadInfoTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYClassReadInfoTableViewCell class] forCellReuseIdentifier:@"JYClassReadInfoTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassReadInfoTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYClassReadInfoTableViewCell*)cell refresh:dic];
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