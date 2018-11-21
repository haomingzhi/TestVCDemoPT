//
    //  EditMineViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYEditMineViewController.h"
#import "JYEditMineViewModel.h"
//#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYPhotoCheckTableViewCell.h"
#import "JYTitleTextTfTableViewCell.h"
#import "JYSaveTableViewCell.h"

@interface JYEditMineViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYEditMineViewModel *viewModel;

@end
@implementation JYEditMineViewController
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
        return 154;
    }
    else  if(indexPath.row == 1)
    {
        return 46;
    }
    else  if(indexPath.row == 2)
    {
        return 46;
    }
    else
    {
        return 110;
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
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYPhotoCheckTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYPhotoCheckTableViewCell class] forCellReuseIdentifier:@"JYPhotoCheckTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYPhotoCheckTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYPhotoCheckTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTextTfTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTitleTextTfTableViewCell class] forCellReuseIdentifier:@"JYTitleTextTfTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTextTfTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTitleTextTfTableViewCell*)cell refresh:dic];

    }
    else  if (indexPath.row == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTextTfTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYTitleTextTfTableViewCell class] forCellReuseIdentifier:@"JYTitleTextTfTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYTitleTextTfTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYTitleTextTfTableViewCell*)cell refresh:dic];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"JYSaveTableViewCell"];
        if(!cell)
        {
            [tableView registerClass:[JYSaveTableViewCell class] forCellReuseIdentifier:@"JYSaveTableViewCell"];
            //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
            cell = [tableView dequeueReusableCellWithIdentifier:@"JYSaveTableViewCell"];
        }
//    NSDictionary *dic;
//    [(JYSaveTableViewCell*)cell refresh:dic];
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