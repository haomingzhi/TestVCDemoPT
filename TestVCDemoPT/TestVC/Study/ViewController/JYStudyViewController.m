//
    //  StudyViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYStudyViewController.h"
#import "JYStudyViewModel.h"
#import "CustomRefreshGifHeader.h"
#import "DDExNoDataView.h"
#import "JYStudyOrderTableViewCell.h"


@interface JYStudyViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JYStudyViewModel *viewModel;

@end

@implementation JYStudyViewController
    -(void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.tableView];

}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 241;
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     __weak typeof(self) weak_self = self;
    UITableViewCell *cell;
     cell = [tableView dequeueReusableCellWithIdentifier:@"JYStudyOrderTableViewCell"];
    if(!cell)
    {
    [tableView registerClass:[JYStudyOrderTableViewCell class] forCellReuseIdentifier:@"JYStudyOrderTableViewCell"];
    //     [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:tag];
    cell = [tableView dequeueReusableCellWithIdentifier:@"JYStudyOrderTableViewCell"];
    }
    //    NSDictionary *dic;
    //    [(JYStudyOrderTableViewCell*)cell refresh:dic];

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
