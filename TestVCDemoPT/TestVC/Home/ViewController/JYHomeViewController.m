//
    //  HomeViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYHomeViewController.h"
#import "JYHomeViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYFlashTableViewCell.h"
#import "JYImgTableViewCell.h"
#import "JYRecentRecTableViewCell.h"
#import "JYClassTableViewCell.h"


@interface JYHomeViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYHomeViewModel *viewModel;

@end

@implementation JYHomeViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];
//    self.title = @"";
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
            return 300;
        }
        else  if(indexPath.row == 1)
        {
            return 132;
        }
        else
        {
            return 68;
        }
    }
    else  if(indexPath.section == 1)
    {
        return 133;
    }
    else
    {
        return 184;
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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     if(section == 0)
    {
        return 3;
    }
    else  if(section == 1)
    {
        return 1;
    }
    else
    {
        return 1;
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
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYFlashTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYFlashTableViewCell class] forCellReuseIdentifier:@"JYFlashTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYFlashTableViewCell"];
        }
    //    NSDictionary *dic;
    //    [(JYFlashTableViewCell*)cell refresh:dic];
    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYImgTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYImgTableViewCell class] forCellReuseIdentifier:@"JYImgTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYImgTableViewCell"];
        }
    //    NSDictionary *dic;
    //    [(JYImgTableViewCell*)cell refresh:dic];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYRecentRecTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYRecentRecTableViewCell class] forCellReuseIdentifier:@"JYRecentRecTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYRecentRecTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYRecentRecTableViewCell*)cell refresh:dic];
    };
    }
        else  if(indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"xx"];
        if(!cell)
        {
            [tableView registerClass:[JYRecentRecTableViewCell class] forCellReuseIdentifier:@"xx"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"xx"];
        }
        //    NSDictionary *dic;
        //    [(JYRecentRecTableViewCell*)cell refresh:dic];
    }
        else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYClassTableViewCell class] forCellReuseIdentifier:@"JYClassTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYClassTableViewCell"];
        }
        //    NSDictionary *dic;
        //    [(JYRecentRecTableViewCell*)cell refresh:dic];
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
