//
//  DDScrollView.m
//  NIM
//
//  Created by apple on 2018/7/18.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "DDScrollView.h"
//#import "UIView+NTES.h"
@interface DDScrollView()<UIScrollViewDelegate>
@end

@implementation DDScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces = NO;
    }
    return self;
}

-(void)genTableViews//生成tableview
{
    if (_tables.count != 0) {
        NSMutableArray *arr = [NSMutableArray new];
        for (NSInteger i = 0; i < _tablesCount; i++) {
            UITableView *tb;
            if (_tables.count > 0) {
                tb = ((NSMutableArray *)_tables).lastObject;
                [((NSMutableArray *)_tables) removeLastObject];
                [arr addObject:tb];
                 [self addSubview:tb];
                tb.delegate = self.DDdelegate;
                tb.dataSource = self.DDdelegate;
                  tb.tableFooterView = [UIView new];
                 tb.tag = 100 + arr.count - 1;
            }
            else
            {
          tb = [[UITableView alloc] initWithFrame:CGRectZero];
            [arr addObject:tb];
            [self addSubview:tb];
                tb.delegate = self.DDdelegate;
                tb.dataSource = self.DDdelegate;
                  tb.tableFooterView = [UIView new];
                 tb.tag = 100 + arr.count - 1;
            }
        }
        if (_tables.count > 0) {
            [_tables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UITableView *v = obj;
                v.delegate = nil;
                v.dataSource = nil;
                [v removeFromSuperview];
            }];
        }
        _tables = arr;
    }
    else
    {
   NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i = 0; i < _tablesCount; i++) {
      UITableView *tb = [[UITableView alloc] initWithFrame:CGRectZero];
        [arr addObject:tb];
        tb.delegate = self.DDdelegate;
        tb.dataSource = self.DDdelegate;
        [self addSubview:tb];
        tb.tableFooterView = [UIView new];
         tb.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tb.separatorInset = UIEdgeInsetsMake(0, 18, 0, 18);
        tb.tag = 100 + i;
    }
    _tables = arr;
    }
    self.contentSize = CGSizeMake(self.width * _tablesCount, self.height);
}

-(void)setDDdelegate:(id<DDScrollViewDataDelegate>)DDdelegate
{
    _DDdelegate = DDdelegate;
    [_tables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITableView *tb = obj;
//        tb.delegate = _DDdelegate;
        tb.dataSource = _DDdelegate;
    }];
}

-(void)setDDscrollViewdelegate:(id<DDScrollViewDelegate>)DDscrollViewdelegate
{
    _DDscrollViewdelegate = DDscrollViewdelegate;
    if (_DDscrollViewdelegate) {
        self.delegate = self;
        [_tables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UITableView *tb = obj;
                    tb.delegate = DDscrollViewdelegate;
//            tb.dataSource = _DDdelegate;
        }];
    }
    else
    {
        self.delegate = nil;
        [_tables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UITableView *tb = obj;
            tb.delegate = nil;
            //            tb.dataSource = _DDdelegate;
        }];
    }
}

-(void)setTablesCount:(NSInteger)tablesCount
{
    _tablesCount = tablesCount;
    [self genTableViews];
    [self setNeedsLayout];
}

-(void)setCheckIndex:(NSInteger)checkIndex
{
    _checkIndex = checkIndex;
    [self setContentOffset:CGPointMake(self.width * checkIndex, 0) animated:NO];
    
}

-(void)refreshData
{
    [self refreshData:_checkIndex];
}

-(void)refreshData:(NSInteger)index
{
    UITableView *tb = _tables[index];
    [tb reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if () {
//        <#statements#>
//    }
    _checkIndex = (NSInteger)(scrollView.contentOffset.x + scrollView.width/2.0) / (NSInteger)scrollView.width;
    if ([self.DDscrollViewdelegate respondsToSelector:@selector(changeIndex:srollView:)]) {
        [self.DDscrollViewdelegate changeIndex:_checkIndex  srollView:scrollView];
    }
}


-(void)layoutSubviews
{
    [_tables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITableView *tb = obj;
        tb.width = self.width;
        tb.height = self.height;
        tb.left = idx * self.width;
        tb.top = 0;
         tb.tag = 100 + idx;
    }];
     self.contentSize = CGSizeMake(self.width * _tablesCount, self.height);
}

@end
